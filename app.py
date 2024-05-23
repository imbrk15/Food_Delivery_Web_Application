from flask import Flask, render_template, request, redirect, url_for, flash, session
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime
from decimal import Decimal

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Change this to a random value

# MySQL Connection
try:
    mysql_conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='root',
        database='flask_login_db'
    )
except mysql.connector.Error as err:
    print(f"Error connecting to MySQL: {err}")
    exit(1)

# Define a function to fetch menu items
def get_menu_items(restaurant_id):
    cursor = mysql_conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM menu_items WHERE restaurant_id = %s", (restaurant_id,))
    menu_items = cursor.fetchall()
    cursor.close()
    return menu_items

# Check if the username is valid
def is_username_valid(username):
    cursor = mysql_conn.cursor()
    cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
    user = cursor.fetchone()
    cursor.close()
    return user is None

@app.route('/')
def home():
    return redirect(url_for('login'))  # Redirect to the login page

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        confirm_password = request.form['confirm_password']

        if not username or not password or not confirm_password:
            flash('Username and password are required', 'danger')
            return redirect(url_for('register'))

        if password != confirm_password:
            flash('Passwords do not match', 'danger')
            return redirect(url_for('register'))

        if not is_username_valid(username):
            flash('Username already exists. Please choose a different one.', 'danger')
            return redirect(url_for('register'))

        cursor = mysql_conn.cursor()
        try:
            hashed_password = generate_password_hash(password)
            cursor.execute("INSERT INTO users (username, password) VALUES (%s, %s)",
                           (username, hashed_password))
            mysql_conn.commit()
            flash('Registration successful! Please log in.', 'success')
            return redirect(url_for('login'))
        except mysql.connector.Error as err:
            flash(f"Registration failed: {err}", 'danger')
            return redirect(url_for('register'))
        finally:
            cursor.close()
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        if not username or not password:
            flash('Username and password are required', 'danger')
            return redirect(url_for('login'))

        cursor = mysql_conn.cursor(dictionary=True)
        try:
            cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
            user = cursor.fetchone()

            if user and check_password_hash(user['password'], password):
                # Store user's ID in the session
                session['user_id'] = user['id']
                session['username'] = user['username']  # Store username in session
                flash('Login successful!', 'success')
                return redirect(url_for('dashboard'))
            else:
                flash('Invalid username or password', 'danger')
                return redirect(url_for('login'))
        except mysql.connector.Error as err:
            flash(f"Error logging in: {err}", 'danger')
            return redirect(url_for('login'))
        finally:
            cursor.close()

    return render_template('login.html')
@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        if not username or not password:
            flash('Username and password are required', 'danger')
            return redirect(url_for('admin'))

        cursor = mysql_conn.cursor(dictionary=True)
        try:
            cursor.execute("SELECT * FROM adminlogin WHERE username = %s", (username,))
            user = cursor.fetchone()

            if user and check_password_hash(user['password'], password):
                # Store user's ID in the session
                session['user_id'] = user['id']
                session['username'] = user['username']  # Store username in session
                flash('Login successful!', 'success')
                return redirect(url_for('dashboard'))
            else:
                flash('Invalid username or password', 'danger')
                return redirect(url_for('admin'))
        except mysql.connector.Error as err:
            flash(f"Error logging in: {err}", 'danger')
            return redirect(url_for('admin'))
        finally:
            cursor.close()

    return render_template('admin.html')
@app.route('/adminPage', methods=['GET', 'POST'])
def adminPage():
    if 'user_id' in session:
        username = session['username']  # Retrieve username from session
        # Fetch restaurants data
        cursor = mysql_conn.cursor(dictionary=True)
        try:
            cursor.execute("SELECT * FROM restaurants")
            restaurants = cursor.fetchall()
            return render_template('adminPage.html', restaurants=restaurants)
        except mysql.connector.Error as err:
            flash(f"Error fetching data: {err}", 'danger')
            return redirect(url_for('login'))
        finally:
            cursor.close()
    return render_template('adminPage.html')
    
@app.route('/dashboard')
def dashboard():
    # Check if user is logged in
    if 'user_id' in session:
        username = session['username']  # Retrieve username from session
        # Fetch restaurants data
        cursor = mysql_conn.cursor(dictionary=True)
        try:
            cursor.execute("SELECT * FROM restaurants")
            restaurants = cursor.fetchall()
            return render_template('dashboard.html', username=username, restaurants=restaurants)
        except mysql.connector.Error as err:
            flash(f"Error fetching data: {err}", 'danger')
            return redirect(url_for('login'))
        finally:
            cursor.close()
    else:
        flash('You must be logged in to view the dashboard', 'danger')
        return redirect(url_for('login'))

@app.route('/logout', methods=['POST'])
def logout():
    session.clear()  # Clear the session
    flash('You have been logged out', 'info')
    return redirect(url_for('login'))

@app.route('/restaurant_menu/<int:restaurant_id>', methods=['GET', 'POST'])
def restaurant_menu(restaurant_id):
    # Check if user is logged in
    if 'user_id' in session:
        username = session['username'] 
        
        if request.method == 'POST':
            # Handle the POST request for checkout here
            # You can access the selected items from request.form
            selected_items = request.form.getlist('selected_items')
            # Perform the checkout process here, for example, save the order to the database
            
            return redirect(url_for('checkout'))  # Redirect to the checkout page

        # Fetch menu items for the selected restaurant
        menu_items = get_menu_items(restaurant_id)
        return render_template('restaurant_menu.html', username=username, menu_items=menu_items)
    
    else:
        flash('You must be logged in to view the restaurant menu', 'danger')
        return redirect(url_for('login'))
    
def calculate_total_price(selected_items):
    total_price = 0
    for item in selected_items:
        _, _, quantity, price = parse_selected_item(item)
        total_price += quantity * price
    return Decimal(total_price)

# Function to parse selected item string and extract relevant information
def parse_selected_item(item):
    parts = item.split(',')
    menu_item_id = int(parts[0])
    menu_item_name = parts[1]
    quantity = int(parts[2])
    price = Decimal(parts[3])
    return menu_item_id, menu_item_name, quantity, price

@app.route('/checkout', methods=['GET', 'POST'])
def checkout():
    if 'user_id' in session:
        if request.method == 'POST':
            user_id = session['user_id']
            address = request.form.get('address')
            payment_method = request.form.get('paymentMethod')
            phone_number = request.form.get('phoneNumber')
            selected_items = request.form.getlist('selected_items')
            total_price = calculate_total_price(selected_items)  # Calculate total price based on selected items
            
            # Fetch restaurant information
            cursor = mysql_conn.cursor(dictionary=True)
            cursor.execute("SELECT id, name FROM restaurants LIMIT 1")  # Assuming there's only one restaurant for now
            restaurant = cursor.fetchone()
            cursor.close()

            # Debugging: Print form data
            print("Form Data:")
            print("User ID:", user_id)
            print("Address:", address)
            print("Payment Method:", payment_method)
            print("Phone Number:", phone_number)
            print("Selected Items:", selected_items)

            cursor = mysql_conn.cursor()
            try:
                # Insert order data into the order_hist table
                for item in selected_items:
                    menu_item_id, menu_item_name, quantity, price = parse_selected_item(item)
                    query = "INSERT INTO order_hist (restaurant_id, restaurant_name, user_id, menu_item_id, menu_item_name, quantity, total, address, phone_no, payment_mode) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                    cursor.execute(query, (restaurant['id'], restaurant['name'], user_id, menu_item_id, menu_item_name, quantity, price, address, phone_number, payment_method))
                mysql_conn.commit()
                flash('Order placed successfully!', 'success')
                return redirect(url_for('thankyou'))
            except mysql.connector.Error as err:
                flash(f"Error placing order: {err}", 'danger')
                return redirect(url_for('checkout'))  # Redirect to checkout page in case of error
            finally:
                cursor.close()
        else:
            # Render the checkout page
            username = session['username']
            return render_template('checkout.html', username=username)
    else:
        flash('You must be logged in to place an order', 'danger')
        return redirect(url_for('login'))
    
@app.route('/thankyou')
def thankyou():
    if 'username' in session:
        username = session['username']
        return render_template('thankyou.html', username=username)
    else:
        flash('You must be logged in to view this page', 'danger')
        return redirect(url_for('login'))


if __name__ == '__main__':
    app.run(debug=True)
