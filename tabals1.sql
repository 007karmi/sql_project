-- Create Supplier table
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    address VARCHAR(255)
);

-- Create Menu table
CREATE TABLE Menu (
    menu_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Create MenuItem table
CREATE TABLE MenuItem (
    dish_id INT PRIMARY KEY,
    menu_id INT,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

-- Create TableInfo table
CREATE TABLE TableInfo (
    table_id INT PRIMARY KEY,
    capacity INT
);


-- Create Reservation table
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    table_id INT,
    customer_name VARCHAR(255),
    reservation_time DATETIME,
    party_size INT,
    FOREIGN KEY (table_id) REFERENCES TableInfo(table_id)
);

-- Create OrderInfo table
CREATE TABLE OrderInfo (
    order_id INT PRIMARY KEY,
    table_id INT,
    dish_id INT,
    employee_id INT, -- Added employee_id column
    order_time DATETIME,
    quantity INT,
    FOREIGN KEY (table_id) REFERENCES TableInfo(table_id),
    FOREIGN KEY (dish_id) REFERENCES MenuItem(dish_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Create Ingredient table
CREATE TABLE Ingredient (
    ingredient_id INT PRIMARY KEY,
    name VARCHAR(255),
    quantity_available DECIMAL(10, 2),
    price_per_unit DECIMAL(10, 2)
);


-- Create Inventory table
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    ingredient_id INT,
    quantity_in_stock DECIMAL(10, 2),
    last_restock_date DATE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

-- Create relationship table for Ingredient and MenuItem (Many-to-many)
CREATE TABLE DishIngredient (
    dish_id INT,
    ingredient_id INT,
    PRIMARY KEY (dish_id, ingredient_id),
    FOREIGN KEY (dish_id) REFERENCES MenuItem(dish_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

ALTER TABLE Reservation MODIFY COLUMN reservation_id INT AUTO_INCREMENT PRIMARY KEY;

