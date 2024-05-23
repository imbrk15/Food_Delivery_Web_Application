drop database flask_login_db;
CREATE DATABASE flask_login_db;

USE flask_login_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);


drop table users;

select * from users;

CREATE TABLE IF NOT EXISTS restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    image_url VARCHAR(255)
);
truncate table restaurants; 
INSERT INTO restaurants (name, description, image_url) VALUES
('Restaurant 1', 'Delicious dishes with fresh ingredients.', 'restaurant1.jpg'),
('Restaurant 2', 'Traditional flavors with a modern twist.', 'restaurant2.jpg'),
('Restaurant 3', 'Exquisite cuisine prepared by top chefs.', 'restaurant3.jpg'),
('Restaurant 4', 'Authentic flavors from around the world.', 'restaurant4.jpg'),
('Restaurant 5', 'Serving comfort food made with love.', 'restaurant5.jpg'),
('Restaurant 6', 'Healthy and nutritious meals for all.', 'restaurant6.jpg'),
('Restaurant 7', 'Gourmet experience with a touch of elegance.', 'restaurant7.jpg'),
('Restaurant 8', 'Specializing in vegan and vegetarian options.', 'restaurant8.jpg'),
('Restaurant 9', 'A taste of home with every bite.', 'restaurant9.jpg'),
('Restaurant 10', 'Artisanal cuisine inspired by local ingredients.', 'restaurant10.jpg'),
('Restaurant 11', 'Classic dishes with a contemporary flair.', 'restaurant11.jpg'),
('Restaurant 12', 'Indulge in our decadent desserts.', 'restaurant12.jpg'),
('Restaurant 13', 'Fusion of flavors for a unique dining experience.', 'restaurant13.jpg'),
('Restaurant 14', 'Savor the essence of fine dining.', 'restaurant14.jpg'),
('Restaurant 15', 'Comfortable ambiance and great food.', 'restaurant15.jpg'),
('Restaurant 16', 'Explore a world of flavors under one roof.', 'restaurant16.jpg'),
('Restaurant 17', 'Innovative dishes crafted by our chefs.', 'restaurant17.jpg'),
('Restaurant 18', 'Relax and enjoy our signature cocktails.', 'restaurant18.jpg'),
('Restaurant 19', 'Unforgettable dining experience with stunning views.', 'restaurant19.jpg'),
('Restaurant 20', 'Fresh seafood served with a smile.', 'restaurant20.jpg'),
('Restaurant 21', 'Discover the joy of authentic street food.', 'restaurant21.jpg'),
('Restaurant 22', 'Tantalize your taste buds with our gourmet pizzas.', 'restaurant22.jpg'),
('Restaurant 23', 'Fine wines and delectable appetizers.', 'restaurant23.jpg'),
('Restaurant 24', 'Family-friendly atmosphere with a diverse menu.', 'restaurant24.jpg'),
('Restaurant 25', 'Crafted cocktails and creative cuisine.', 'restaurant25.jpg');


CREATE TABLE IF NOT EXISTS menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(8, 2) NOT NULL,
    image_url VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);
select * from menu_items;
-- truncate table menu_items; 
INSERT INTO menu_items (restaurant_id, name, description, price, image_url) VALUES
-- Restaurant 1
(1, 'Item 1', 'Description of Item 1 for Restaurant 1', 10.99, 'item1.jpg'),
(1, 'Item 2', 'Description of Item 2 for Restaurant 1', 8.99, 'item2.jpg'),
(1, 'Item 3', 'Description of Item 3 for Restaurant 1', 12.99, 'item3.jpg'),
(1, 'Item 4', 'Description of Item 4 for Restaurant 1', 9.99, 'item4.jpg'),
(1, 'Item 5', 'Description of Item 5 for Restaurant 1', 11.99, 'item5.jpg'),
(1, 'Item 6', 'Description of Item 6 for Restaurant 1', 7.99, 'item6.jpg'),
(1, 'Item 7', 'Description of Item 7 for Restaurant 1', 13.99, 'item7.jpg'),

-- Restaurant 2
(2, 'Item 1', 'Description of Item 1 for Restaurant 2', 10.99, 'item1.jpg'),
(2, 'Item 2', 'Description of Item 2 for Restaurant 2', 8.99, 'item2.jpg'),
(2, 'Item 3', 'Description of Item 3 for Restaurant 2', 12.99, 'item3.jpg'),
(2, 'Item 4', 'Description of Item 4 for Restaurant 2', 9.99, 'item4.jpg'),
(2, 'Item 5', 'Description of Item 5 for Restaurant 2', 11.99, 'item5.jpg'),
(2, 'Item 6', 'Description of Item 6 for Restaurant 2', 7.99, 'item6.jpg'),
(2, 'Item 7', 'Description of Item 7 for Restaurant 2', 13.99, 'item7.jpg'),

-- Restaurant 3
(3, 'Item 1', 'Description of Item 1 for Restaurant 3', 10.99, 'item1.jpg'),
(3, 'Item 2', 'Description of Item 2 for Restaurant 3', 8.99, 'item2.jpg'),
(3, 'Item 3', 'Description of Item 3 for Restaurant 3', 12.99, 'item3.jpg'),
(3, 'Item 4', 'Description of Item 4 for Restaurant 3', 9.99, 'item4.jpg'),
(3, 'Item 5', 'Description of Item 5 for Restaurant 3', 11.99, 'item5.jpg'),
(3, 'Item 6', 'Description of Item 6 for Restaurant 3', 7.99, 'item6.jpg'),
(3, 'Item 7', 'Description of Item 7 for Restaurant 3', 13.99, 'item7.jpg'),

-- Restaurants 4-25 (similar to Restaurant 1)
(4, 'Item 1', 'Description of Item 1 for Restaurant 4', 10.99, 'item1.jpg'),
(4, 'Item 2', 'Description of Item 2 for Restaurant 4', 8.99, 'item2.jpg'),
(4, 'Item 3', 'Description of Item 3 for Restaurant 4', 12.99, 'item3.jpg'),
(4, 'Item 4', 'Description of Item 4 for Restaurant 4', 9.99, 'item4.jpg'),
(4, 'Item 5', 'Description of Item 5 for Restaurant 4', 11.99, 'item5.jpg'),
(4, 'Item 6', 'Description of Item 6 for Restaurant 4', 7.99, 'item6.jpg'),
(4, 'Item 7', 'Description of Item 7 for Restaurant 4', 13.99, 'item7.jpg'),

-- Add items for restaurants 5-25 similarly
(5, 'Item 1', 'Description of Item 1 for Restaurant 5', 10.99, 'item1.jpg'),
(5, 'Item 2', 'Description of Item 2 for Restaurant 5', 8.99, 'item2.jpg'),
(5, 'Item 3', 'Description of Item 3 for Restaurant 5', 12.99, 'item3.jpg'),
(5, 'Item 4', 'Description of Item 4 for Restaurant 5', 9.99, 'item4.jpg'),
(5, 'Item 5', 'Description of Item 5 for Restaurant 5', 11.99, 'item5.jpg'),
(5, 'Item 6', 'Description of Item 6 for Restaurant 5', 7.99, 'item6.jpg'),
(5, 'Item 7', 'Description of Item 7 for Restaurant 5', 13.99, 'item7.jpg'),

(6, 'Item 1', 'Description of Item 1 for Restaurant 6', 10.99, 'item1.jpg'),
(6, 'Item 2', 'Description of Item 2 for Restaurant 6', 8.99, 'item2.jpg'),
(6, 'Item 3', 'Description of Item 3 for Restaurant 6', 12.99, 'item3.jpg'),
(6, 'Item 4', 'Description of Item 4 for Restaurant 6', 9.99, 'item4.jpg'),
(6, 'Item 5', 'Description of Item 5 for Restaurant 6', 11.99, 'item5.jpg'),
(6, 'Item 6', 'Description of Item 6 for Restaurant 6', 7.99, 'item6.jpg'),
(6, 'Item 7', 'Description of Item 7 for Restaurant 6', 13.99, 'item7.jpg'),

-- continue for restaurants 7-25
(7, 'Item 1', 'Description of Item 1 for Restaurant 7', 10.99, 'item1.jpg'),
(7, 'Item 2', 'Description of Item 2 for Restaurant 7', 8.99, 'item2.jpg'),
(7, 'Item 3', 'Description of Item 3 for Restaurant 7', 12.99, 'item3.jpg'),
(7, 'Item 4', 'Description of Item 4 for Restaurant 7', 9.99, 'item4.jpg'),
(7, 'Item 5', 'Description of Item 5 for Restaurant 7', 11.99, 'item5.jpg'),
(7, 'Item 6', 'Description of Item 6 for Restaurant 7', 7.99, 'item6.jpg'),
(7, 'Item 7', 'Description of Item 7 for Restaurant 7', 13.99, 'item7.jpg'),

-- continue for restaurants 8-25 similarly
(8, 'Item 1', 'Description of Item 1 for Restaurant 8', 10.99, 'item1.jpg'),
(8, 'Item 2', 'Description of Item 2 for Restaurant 8', 8.99, 'item2.jpg'),
(8, 'Item 3', 'Description of Item 3 for Restaurant 8', 12.99, 'item3.jpg'),
(8, 'Item 4', 'Description of Item 4 for Restaurant 8', 9.99, 'item4.jpg'),
(8, 'Item 5', 'Description of Item 5 for Restaurant 8', 11.99, 'item5.jpg'),
(8, 'Item 6', 'Description of Item 6 for Restaurant 8', 7.99, 'item6.jpg'),
(8, 'Item 7', 'Description of Item 7 for Restaurant 8', 13.99, 'item7.jpg'),

-- continue for restaurants 9-25 similarly
(9, 'Item 1', 'Description of Item 1 for Restaurant 9', 10.99, 'item1.jpg'),
(9, 'Item 2', 'Description of Item 2 for Restaurant 9', 8.99, 'item2.jpg'),
(9, 'Item 3', 'Description of Item 3 for Restaurant 9', 12.99, 'item3.jpg'),
(9, 'Item 4', 'Description of Item 4 for Restaurant 9', 9.99, 'item4.jpg'),
(9, 'Item 5', 'Description of Item 5 for Restaurant 9', 11.99, 'item5.jpg'),
(9, 'Item 6', 'Description of Item 6 for Restaurant 9', 7.99, 'item6.jpg'),
(9, 'Item 7', 'Description of Item 7 for Restaurant 9', 13.99, 'item7.jpg'),

-- continue for restaurants 10-25 similarly
(10, 'Item 1', 'Description of Item 1 for Restaurant 10', 10.99, 'item1.jpg'),
(10, 'Item 2', 'Description of Item 2 for Restaurant 10', 8.99, 'item2.jpg'),
(10, 'Item 3', 'Description of Item 3 for Restaurant 10', 12.99, 'item3.jpg'),
(10, 'Item 4', 'Description of Item 4 for Restaurant 10', 9.99, 'item4.jpg'),
(10, 'Item 5', 'Description of Item 5 for Restaurant 10', 11.99, 'item5.jpg'),
(10, 'Item 6', 'Description of Item 6 for Restaurant 10', 7.99, 'item6.jpg'),
(10, 'Item 7', 'Description of Item 7 for Restaurant 10', 13.99, 'item7.jpg'),

-- continue for restaurants 11-25 similarly
(11, 'Item 1', 'Description of Item 1 for Restaurant 11', 10.99, 'item1.jpg'),
(11, 'Item 2', 'Description of Item 2 for Restaurant 11', 8.99, 'item2.jpg'),
(11, 'Item 3', 'Description of Item 3 for Restaurant 11', 12.99, 'item3.jpg'),
(11, 'Item 4', 'Description of Item 4 for Restaurant 11', 9.99, 'item4.jpg'),
(11, 'Item 5', 'Description of Item 5 for Restaurant 11', 11.99, 'item5.jpg'),
(11, 'Item 6', 'Description of Item 6 for Restaurant 11', 7.99, 'item6.jpg'),
(11, 'Item 7', 'Description of Item 7 for Restaurant 11', 13.99, 'item7.jpg'),

-- continue for restaurants 12-25 similarly
(12, 'Item 1', 'Description of Item 1 for Restaurant 12', 10.99, 'item1.jpg'),
(12, 'Item 2', 'Description of Item 2 for Restaurant 12', 8.99, 'item2.jpg'),
(12, 'Item 3', 'Description of Item 3 for Restaurant 12', 12.99, 'item3.jpg'),
(12, 'Item 4', 'Description of Item 4 for Restaurant 12', 9.99, 'item4.jpg'),
(12, 'Item 5', 'Description of Item 5 for Restaurant 12', 11.99, 'item5.jpg'),
(12, 'Item 6', 'Description of Item 6 for Restaurant 12', 7.99, 'item6.jpg'),
(12, 'Item 7', 'Description of Item 7 for Restaurant 12', 13.99, 'item7.jpg'),

-- continue for restaurants 13-25 similarly
(13, 'Item 1', 'Description of Item 1 for Restaurant 13', 10.99, 'item1.jpg'),
(13, 'Item 2', 'Description of Item 2 for Restaurant 13', 8.99, 'item2.jpg'),
(13, 'Item 3', 'Description of Item 3 for Restaurant 13', 12.99, 'item3.jpg'),
(13, 'Item 4', 'Description of Item 4 for Restaurant 13', 9.99, 'item4.jpg'),
(13, 'Item 5', 'Description of Item 5 for Restaurant 13', 11.99, 'item5.jpg'),
(13, 'Item 6', 'Description of Item 6 for Restaurant 13', 7.99, 'item6.jpg'),
(13, 'Item 7', 'Description of Item 7 for Restaurant 13', 13.99, 'item7.jpg'),

(14, 'Item 1', 'Description of Item 1 for Restaurant 14', 10.99, 'item1.jpg'),
(14, 'Item 2', 'Description of Item 2 for Restaurant 14', 8.99, 'item2.jpg'),
(14, 'Item 3', 'Description of Item 3 for Restaurant 14', 12.99, 'item3.jpg'),
(14, 'Item 4', 'Description of Item 4 for Restaurant 14', 9.99, 'item4.jpg'),
(14, 'Item 5', 'Description of Item 5 for Restaurant 14', 11.99, 'item5.jpg'),
(14, 'Item 6', 'Description of Item 6 for Restaurant 14', 7.99, 'item6.jpg'),
(14, 'Item 7', 'Description of Item 7 for Restaurant 14', 13.99, 'item7.jpg'),

(15, 'Item 1', 'Description of Item 1 for Restaurant 15', 10.99, 'item1.jpg'),
(15, 'Item 2', 'Description of Item 2 for Restaurant 15', 8.99, 'item2.jpg'),
(15, 'Item 3', 'Description of Item 3 for Restaurant 15', 12.99, 'item3.jpg'),
(15, 'Item 4', 'Description of Item 4 for Restaurant 15', 9.99, 'item4.jpg'),
(15, 'Item 5', 'Description of Item 5 for Restaurant 15', 11.99, 'item5.jpg'),
(15, 'Item 6', 'Description of Item 6 for Restaurant 15', 7.99, 'item6.jpg'),
(15, 'Item 7', 'Description of Item 7 for Restaurant 15', 13.99, 'item7.jpg'),

(16, 'Item 1', 'Description of Item 1 for Restaurant 16', 10.99, 'item1.jpg'),
(16, 'Item 2', 'Description of Item 2 for Restaurant 16', 8.99, 'item2.jpg'),
(16, 'Item 3', 'Description of Item 3 for Restaurant 16', 12.99, 'item3.jpg'),
(16, 'Item 4', 'Description of Item 4 for Restaurant 16', 9.99, 'item4.jpg'),
(16, 'Item 5', 'Description of Item 5 for Restaurant 16', 11.99, 'item5.jpg'),
(16, 'Item 6', 'Description of Item 6 for Restaurant 16', 7.99, 'item6.jpg'),
(16, 'Item 7', 'Description of Item 7 for Restaurant 16', 13.99, 'item7.jpg'),

(17, 'Item 1', 'Description of Item 1 for Restaurant 17', 10.99, 'item1.jpg'),
(17, 'Item 2', 'Description of Item 2 for Restaurant 17', 8.99, 'item2.jpg'),
(17, 'Item 3', 'Description of Item 3 for Restaurant 17', 12.99, 'item3.jpg'),
(17, 'Item 4', 'Description of Item 4 for Restaurant 17', 9.99, 'item4.jpg'),
(17, 'Item 5', 'Description of Item 5 for Restaurant 17', 11.99, 'item5.jpg'),
(17, 'Item 6', 'Description of Item 6 for Restaurant 17', 7.99, 'item6.jpg'),
(17, 'Item 7', 'Description of Item 7 for Restaurant 17', 13.99, 'item7.jpg'),

(18, 'Item 1', 'Description of Item 1 for Restaurant 18', 10.99, 'item1.jpg'),
(18, 'Item 2', 'Description of Item 2 for Restaurant 18', 8.99, 'item2.jpg'),
(18, 'Item 3', 'Description of Item 3 for Restaurant 18', 12.99, 'item3.jpg'),
(18, 'Item 4', 'Description of Item 4 for Restaurant 18', 9.99, 'item4.jpg'),
(18, 'Item 5', 'Description of Item 5 for Restaurant 18', 11.99, 'item5.jpg'),
(18, 'Item 6', 'Description of Item 6 for Restaurant 18', 7.99, 'item6.jpg'),
(18, 'Item 7', 'Description of Item 7 for Restaurant 18', 13.99, 'item7.jpg'),

(19, 'Item 1', 'Description of Item 1 for Restaurant 19', 10.99, 'item1.jpg'),
(19, 'Item 2', 'Description of Item 2 for Restaurant 19', 8.99, 'item2.jpg'),
(19, 'Item 3', 'Description of Item 3 for Restaurant 19', 12.99, 'item3.jpg'),
(19, 'Item 4', 'Description of Item 4 for Restaurant 19', 9.99, 'item4.jpg'),
(19, 'Item 5', 'Description of Item 5 for Restaurant 19', 11.99, 'item5.jpg'),
(19, 'Item 6', 'Description of Item 6 for Restaurant 19', 7.99, 'item6.jpg'),
(19, 'Item 7', 'Description of Item 7 for Restaurant 19', 13.99, 'item7.jpg'),

(20, 'Item 1', 'Description of Item 1 for Restaurant 20', 10.99, 'item1.jpg'),
(20, 'Item 2', 'Description of Item 2 for Restaurant 20', 8.99, 'item2.jpg'),
(20, 'Item 3', 'Description of Item 3 for Restaurant 20', 12.99, 'item3.jpg'),
(20, 'Item 4', 'Description of Item 4 for Restaurant 20', 9.99, 'item4.jpg'),
(20, 'Item 5', 'Description of Item 5 for Restaurant 20', 11.99, 'item5.jpg'),
(20, 'Item 6', 'Description of Item 6 for Restaurant 20', 7.99, 'item6.jpg'),
(20, 'Item 7', 'Description of Item 7 for Restaurant 20', 13.99, 'item7.jpg'),

(21, 'Item 1', 'Description of Item 1 for Restaurant 21', 10.99, 'item1.jpg'),
(21, 'Item 2', 'Description of Item 2 for Restaurant 21', 8.99, 'item2.jpg'),
(21, 'Item 3', 'Description of Item 3 for Restaurant 21', 12.99, 'item3.jpg'),
(21, 'Item 4', 'Description of Item 4 for Restaurant 21', 9.99, 'item4.jpg'),
(21, 'Item 5', 'Description of Item 5 for Restaurant 21', 11.99, 'item5.jpg'),
(21, 'Item 6', 'Description of Item 6 for Restaurant 21', 7.99, 'item6.jpg'),
(21, 'Item 7', 'Description of Item 7 for Restaurant 21', 13.99, 'item7.jpg'),

(22, 'Item 1', 'Description of Item 1 for Restaurant 22', 10.99, 'item1.jpg'),
(22, 'Item 2', 'Description of Item 2 for Restaurant 22', 8.99, 'item2.jpg'),
(22, 'Item 3', 'Description of Item 3 for Restaurant 22', 12.99, 'item3.jpg'),
(22, 'Item 4', 'Description of Item 4 for Restaurant 22', 9.99, 'item4.jpg'),
(22, 'Item 5', 'Description of Item 5 for Restaurant 22', 11.99, 'item5.jpg'),
(22, 'Item 6', 'Description of Item 6 for Restaurant 22', 7.99, 'item6.jpg'),
(22, 'Item 7', 'Description of Item 7 for Restaurant 22', 13.99, 'item7.jpg'),

(23, 'Item 1', 'Description of Item 1 for Restaurant 23', 10.99, 'item1.jpg'),
(23, 'Item 2', 'Description of Item 2 for Restaurant 23', 8.99, 'item2.jpg'),
(23, 'Item 3', 'Description of Item 3 for Restaurant 23', 12.99, 'item3.jpg'),
(23, 'Item 4', 'Description of Item 4 for Restaurant 23', 9.99, 'item4.jpg'),
(23, 'Item 5', 'Description of Item 5 for Restaurant 23', 11.99, 'item5.jpg'),
(23, 'Item 6', 'Description of Item 6 for Restaurant 23', 7.99, 'item6.jpg'),
(23, 'Item 7', 'Description of Item 7 for Restaurant 23', 13.99, 'item7.jpg'),

(24, 'Item 1', 'Description of Item 1 for Restaurant 24', 10.99, 'item1.jpg'),
(24, 'Item 2', 'Description of Item 2 for Restaurant 24', 8.99, 'item2.jpg'),
(24, 'Item 3', 'Description of Item 3 for Restaurant 24', 12.99, 'item3.jpg'),
(24, 'Item 4', 'Description of Item 4 for Restaurant 24', 9.99, 'item4.jpg'),
(24, 'Item 5', 'Description of Item 5 for Restaurant 24', 11.99, 'item5.jpg'),
(24, 'Item 6', 'Description of Item 6 for Restaurant 24', 7.99, 'item6.jpg'),
(24, 'Item 7', 'Description of Item 7 for Restaurant 24', 13.99, 'item7.jpg'),

(25, 'Item 1', 'Description of Item 1 for Restaurant 25', 10.99, 'item1.jpg'),
(25, 'Item 2', 'Description of Item 2 for Restaurant 25', 8.99, 'item2.jpg'),
(25, 'Item 3', 'Description of Item 3 for Restaurant 25', 12.99, 'item3.jpg'),
(25, 'Item 4', 'Description of Item 4 for Restaurant 25', 9.99, 'item4.jpg'),
(25, 'Item 5', 'Description of Item 5 for Restaurant 25', 11.99, 'item5.jpg'),
(25, 'Item 6', 'Description of Item 6 for Restaurant 25', 7.99, 'item6.jpg'),
(25, 'Item 7', 'Description of Item 7 for Restaurant 25', 13.99, 'item7.jpg');

select * from order_hist;
CREATE TABLE IF NOT EXISTS order_hist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    restaurant_name VARCHAR(255),
    user_id INT,
    menu_item_id INT,
    menu_item_name VARCHAR(255),
    quantity INT,
    total DECIMAL(10, 2),
    address TEXT,
    phone_no VARCHAR(20),
    payment_mode VARCHAR(20),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);
