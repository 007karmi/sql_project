INSERT INTO Supplier (supplier_id, name, phone_number, email, address) VALUES
(1, 'Breakfast Supplier', '0501234567', 'breakfastsupplier@example.com', '123 Breakfast St'),
(2, 'Lunch Supplier', '0502345678', 'lunchsupplier@example.com', '456 Lunch Ave'),
(3, 'Desserts Supplier', '0503456789', 'dessertssupplier@example.com', '789 Dessert Blvd'),
(4, 'Drinks Supplier', '0504567890', 'drinkssupplier@example.com', '321 Drinks Rd');


-- Insert data into Menu table
INSERT INTO Menu (menu_id, name, description,supplier_id) VALUES
(1, 'Breakfast Menu', 'Delicious breakfast items to start your day',1),
(2, 'Lunch Menu', 'Satisfying lunch options for a midday meal',2),
(3, 'Desserts Menu', 'Sweet treats to indulge your cravings',3),
(4, 'Drinks Menu', 'Refreshing beverages to quench your thirst',4);


-- Insert data into Employee table
INSERT INTO Employee (employee_id, name, salary, hire_date) VALUES
(1, 'sagi granot',  5000.00, '2023-01-01'),
(2, 'ron moyal',  2000.00, '2023-01-15'),
(3, 'tomer grin', 2500.00, '2023-02-01'),
(4, 'daniel raskind',  3000.00, '2023-02-15'),
(5, 'idan gur',  1800.00, '2023-03-01'),
(6, 'yoav atiya',  3500.00, '2023-03-15');

-- Insert data into TableInfo table
INSERT INTO TableInfo (table_id, capacity) VALUES
(1, 4),
(2, 6),
(3, 2),
(4, 4),
(5, 6),
(6, 2),
(7, 8);

-- Insert data into MenuItem table
INSERT INTO MenuItem (dish_id, menu_id, name, description, price) VALUES
-- Breakfast Menu
(1, 1, 'Eggs Benedict', 'Poached eggs, ham, and hollandaise sauce on an English muffin', 10.99),
(2, 1, 'Pancakes', 'Fluffy pancakes served with maple syrup and butter', 8.99),
(3, 1, 'Avocado Toast', 'Toasted bread topped with mashed avocado, cherry tomatoes, and feta cheese', 9.99),
(4, 1, 'Breakfast Burrito', 'Scrambled eggs, bacon, cheese, and salsa wrapped in a warm tortilla', 11.99),
-- Lunch Menu
(5, 2, 'Caesar Salad', 'Crisp romaine lettuce, croutons, parmesan cheese, and Caesar dressing', 9.99),
(6, 2, 'Club Sandwich', 'Triple-decker sandwich with turkey, bacon, lettuce, tomato, and mayo', 12.99),
(7, 2, 'Grilled Chicken Salad', 'Grilled chicken breast served on a bed of mixed greens with balsamic vinaigrette', 11.99),
(8, 2, 'Cheeseburger', 'Beef patty topped with cheddar cheese, lettuce, tomato, and onion on a sesame seed bun', 10.99),
-- Desserts Menu
(9, 3, 'Chocolate Brownie', 'Rich and gooey chocolate brownie served with vanilla ice cream', 6.99),
(10, 3, 'New York Cheesecake', 'Creamy cheesecake on a graham cracker crust, topped with fruit compote', 8.99),
(11, 3, 'Apple Pie', 'Homemade apple pie with a flaky crust, served warm with a scoop of ice cream', 7.99),
(12, 3, 'Tiramisu', 'Classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese', 9.99),
-- Drinks Menu
(13, 4, 'Iced Coffee', 'Chilled coffee served over ice with a splash of milk', 4.99),
(14, 4, 'Fruit Smoothie', 'Blend of mixed fruits, yogurt, and honey', 5.99),
(15, 4, 'Mojito', 'Refreshing cocktail made with rum, mint, lime, sugar, and soda water', 7.99),
(16, 4, 'Lemonade', 'Freshly squeezed lemon juice sweetened with simple syrup and served over ice', 3.99);

-- Insert data into Ingredient table
INSERT INTO Ingredient (ingredient_id, name, quantity_available, price_per_unit) VALUES
(1, 'Eggs', 100, 0.20),
(2, 'Ham', 50, 1.00),
(3, 'English Muffin', 80, 0.50),
(4, 'Pancake Mix', 120, 2.50),
(5, 'Maple Syrup', 40, 3.00),
(6, 'Avocado', 30, 1.50),
(7, 'Cherry Tomatoes', 20, 0.75),
(8, 'Feta Cheese', 25, 1.75),
(9, 'Flour Tortillas', 60, 1.00),
(10, 'Romaine Lettuce', 40, 1.25),
(11, 'Croutons', 50, 0.50),
(12, 'Parmesan Cheese', 30, 2.00),
(13, 'Chicken Breast', 35, 3.50),
(14, 'Mixed Greens', 20, 1.75),
(15, 'Balsamic Vinaigrette', 15, 1.50),
(16, 'Ground Beef', 45, 4.00),
(17, 'Cheddar Cheese', 30, 2.50),
(18, 'Sesame Seed Bun', 50, 0.75),
(19, 'Chocolate', 60, 2.00),
(20, 'Cream Cheese', 25, 1.75),
(21, 'Graham Crackers', 40, 1.25),
(22, 'Apples', 30, 0.75),
(23, 'Ladyfingers', 20, 1.50),
(24, 'Mascarpone Cheese', 25, 3.00),
(25, 'Coffee Beans', 80, 1.50),
(26, 'Milk', 60, 1.00),
(27, 'Fruit Mix', 50, 2.50),
(28, 'Yogurt', 40, 1.50),
(29, 'Mint Leaves', 30, 1.00),
(30, 'Lime', 40, 0.75),
(31, 'Rum', 25, 5.00),
(32, 'Sugar', 40, 0.50),
(33, 'Lemons', 30, 0.50);

-- Insert data into DishIngredient table
INSERT INTO DishIngredient (dish_id, ingredient_id) VALUES
-- Eggs Benedict Ingredients
(1, 1), (1, 2), (1, 3),
-- Pancakes Ingredients
(2, 4), (2, 5),
-- Avocado Toast Ingredients
(3, 6), (3, 7), (3, 8),
-- Breakfast Burrito Ingredients
(4, 1), (4, 2), (4, 9), (4, 10),
-- Caesar Salad Ingredients
(5, 10), (5, 11), (5, 12),
-- Club Sandwich Ingredients
(6, 13), (6, 14), (6, 15),
-- Grilled Chicken Salad Ingredients
(7, 13), (7, 14), (7, 15),
-- Cheeseburger Ingredients
(8, 16), (8, 17), (8, 18),
-- Chocolate Brownie Ingredients
(9, 19), (9, 20),
-- New York Cheesecake Ingredients
(10, 21), (10, 22), (10, 23), (10, 24),
-- Apple Pie Ingredients
(11, 22), (11, 33),
-- Tiramisu Ingredients
(12, 23), (12, 25), (12, 26), (12, 24),
-- Iced Coffee Ingredients
(13, 25), (13, 26),
-- Fruit Smoothie Ingredients
(14, 27), (14, 28),
-- Mojito Ingredients
(15, 31), (15, 29), (15, 30), (15, 32),
-- Lemonade Ingredients
(16, 33), (16, 32);

-- Insert data into Reservation table
INSERT INTO Reservation (reservation_id, table_id, customer_name, reservation_time, party_size) VALUES
(1, 1, 'yoav rapple', '2024-04-03 18:00:00', 4),
(2, 2, 'roee bahari', '2024-04-04 19:00:00', 2),
(3, 3, 'guy beem', '2024-04-05 12:30:00', 1),
(4, 4, 'alon paz', '2024-04-06 17:30:00', 3),
(5, 5, 'ido nasi', '2024-04-07 20:00:00', 5),
(6, 6, 'ido kor', '2024-04-08 14:00:00', 2),
(7, 7, 'yuval mangan', '2024-04-09 19:30:00', 6),
(8,1,'yoav atia', '2024-04-08 14:00:00',4),
(9,6,'tomer grin', '2024-04-08 13:00:00',6),
(12,1,'idan gur', '2024-04-08 13:00:00',3)
;



-- Insert data intdepartmentso OrderInfo table
INSERT INTO OrderInfo (order_id, table_id, dish_id, employee_id, order_time, quantity) VALUES
(1, 1, 1, 1, '2024-04-03 18:30:00', 2), 
(2, 2, 6, 2, '2024-04-04 19:30:00', 1), 
(3, 3, 11, 3, '2024-04-05 13:00:00', 1), 
(4, 4, 8, 4, '2024-04-06 18:00:00', 2), 
(5, 5, 13, 5, '2024-04-07 20:30:00', 3), 
(6, 6, 2, 6, '2024-04-08 14:30:00', 1), 
(7, 7, 7, 1, '2024-04-09 20:00:00', 4), 
(8, 1, 1, 6, '2024-04-08 14:30:00', 2),
(9, 6, 6, 3, '2024-04-08 13:30:00', 1), 
(10, 1, 13, 4, '2024-04-08 13:30:00', 3); 




-- Insert data into Inventory table
INSERT INTO Inventory (inventory_id, ingredient_id, quantity_in_stock, last_restock_date) VALUES
(1, 1, 100, '2024-04-01'),
(2, 2, 50, '2024-04-01'),
(3, 3, 80, '2024-04-01'),
(4, 4, 120, '2024-04-01'),
(5, 5, 40, '2024-04-01'),
(6, 6, 30, '2024-04-01'),
(7, 7, 20, '2024-04-01'),
(8, 8, 25, '2024-04-01'),
(9, 9, 60, '2024-04-01'),
(10, 10, 40, '2024-04-01'),
(11, 11, 50, '2024-04-01'),
(12, 12, 30, '2024-04-01'),
(13, 13, 35, '2024-04-01'),
(14, 14, 20, '2024-04-01'),
(15, 15, 15, '2024-04-01'),
(16, 16, 45, '2024-04-01'),
(17, 17, 30, '2024-04-01'),
(18, 18, 50, '2024-04-01'),
(19, 19, 60, '2024-04-01'),
(20, 20, 25, '2024-04-01'),
(21, 21, 40, '2024-04-01'),
(22, 22, 30, '2024-04-01'),
(23, 23, 20, '2024-04-01'),
(24, 24, 25, '2024-04-01'),
(25, 25, 80, '2024-04-01'),
(26, 26, 60, '2024-04-01'),
(27, 27, 50, '2024-04-01'),
(28, 28, 40, '2024-04-01'),
(29, 29, 30, '2024-04-01'),
(30, 30, 40, '2024-04-01'),
(31, 31, 25, '2024-04-01'),
(32, 32, 40, '2024-04-01'),
(33, 33, 30, '2024-04-01');
