
SELECT
    DATE(reservation_time) AS reservation_date,
    HOUR(reservation_time) AS reservation_hour,
    COUNT(*) AS total_reservations
FROM
    Reservation

GROUP BY
    DATE(reservation_time), HOUR(reservation_time)
ORDER BY
    total_reservations DESC, reservation_date DESC;

-- -------------------------------------------------------------------------------------------------

-- Procedure to add a new reservation to the database
DELIMITER //
CREATE PROCEDURE AddNewReservation(
    IN reservationTime DATETIME,    
    IN customerName VARCHAR(255),   
    IN partySize INT                
)
BEGIN
    -- Insert a new reservation into the Reservation table
    -- Selects a suitable table based on party size and availability
    INSERT INTO Reservation (table_id, reservation_time, customer_name, party_size)
    SELECT table_id, reservationTime, customerName, partySize 
    FROM TableInfo 
    WHERE capacity >= partySize           -- Ensure selected table has enough capacity for the party size
      AND table_id NOT IN (              -- Ensure selected table is not already reserved during the same time
          SELECT DISTINCT table_id 
          FROM Reservation 
          WHERE reservation_time >= reservationTime
      )
      limit 1;
END;
//
DELIMITER ;
-- -------------------------------------------------------------------------------------------------
CREATE VIEW ProfitableDishes AS
SELECT m.name AS menu_name, mi.name AS dish_name, SUM(oi.quantity * mi.price) AS total_revenue
FROM OrderInfo oi              
JOIN MenuItem mi ON oi.dish_id = mi.dish_id  
JOIN Menu m ON mi.menu_id = m.menu_id        
GROUP BY m.menu_id, mi.dish_id   
ORDER BY total_revenue DESC;    



-- -------------------------------------------------------------------------------------------------
-- Trigger to detect shortage of products and suggest ordering

DELIMITER //
CREATE TRIGGER DetectProductShortage
before UPDATE ON Inventory
FOR EACH ROW
BEGIN
    DECLARE threshold DECIMAL(10, 2); 
    
    SET threshold = 50; 
    
    IF NEW.quantity_in_stock < threshold THEN
        set NEW.quantity_in_stock = 50;
    END IF;
END;
//
DELIMITER ;
-- -------------------------------------------------------------------------------------------------
DELIMITER //

CREATE FUNCTION IdentifyProductShortages()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE shortage_quantity INT DEFAULT 0;
    
    -- Calculate the total shortage quantity of ingredients
    SELECT COUNT(*) INTO shortage_quantity
    FROM (
        SELECT i.ingredient_id
        FROM Ingredient i
        LEFT JOIN DishIngredient di ON i.ingredient_id = di.ingredient_id
        LEFT JOIN Inventory inv ON i.ingredient_id = inv.ingredient_id
        WHERE inv.quantity_available <= 0
        GROUP BY i.ingredient_id
    ) AS shortage_table;
    
    -- Return the total number of ingredients with shortages
    RETURN shortage_quantity;
    
END//

DELIMITER ;


-- -------------------------------------------------------------------------------------------------
SELECT
    DATE(order_time) AS order_date, 
    SUM(quantity * price) AS daily_earnings 
FROM
    OrderInfo
    JOIN MenuItem ON OrderInfo.dish_id = MenuItem.dish_id
GROUP BY
    DATE(order_time) 
ORDER BY
    order_date; 
    
    

-- -------------------------------------------------------------------------------------------------
-- Procedure to calculate expenses and profitability
DELIMITER //

CREATE PROCEDURE CalculateExpensesAndProfitability()
BEGIN
    DECLARE total_expenses DECIMAL(10, 2);
    DECLARE total_revenue DECIMAL(10, 2);
    DECLARE net_profit DECIMAL(10, 2);

    -- Calculate total expenses
    SELECT SUM(salary) INTO total_expenses FROM Employee;

    -- Calculate total revenue
    SELECT SUM(price * quantity) INTO total_revenue FROM OrderInfo
    JOIN MenuItem ON OrderInfo.dish_id = MenuItem.dish_id;

    SET net_profit = total_revenue - total_expenses;

    SELECT total_expenses AS Total_Expenses, total_revenue AS Total_Revenue, net_profit AS Net_Profit;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE MostReservedHour(IN date_param DATE)
BEGIN
    SELECT HOUR(reservation_time) AS RUSH_HOURS
    FROM Reservation
    WHERE DATE(reservation_time) = date_param
    GROUP BY HOUR(reservation_time)
    HAVING COUNT(*) = (
	SELECT MAX(t.reservationCount) FROM (
	SELECT count(*) as reservationCount
    FROM Reservation
    WHERE DATE(reservation_time) = date_param
	GROUP BY HOUR(reservation_time)) as t
    );

END //

DELIMITER ;


SELECT employee_id, name, salary
FROM Employee;

DELIMITER //

CREATE FUNCTION FindDishesByIngredient(ingredient_name VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE dish_names VARCHAR(1000);

    SELECT GROUP_CONCAT(mi.name SEPARATOR ', ')
    INTO dish_names
    FROM MenuItem mi
    JOIN DishIngredient di ON mi.dish_id = di.dish_id
    JOIN Ingredient i ON di.ingredient_id = i.ingredient_id
    WHERE i.name = ingredient_name;

    RETURN dish_names;
END //

DELIMITER ;




SELECT 
    e.employee_id,
    e.name,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(mi.price * oi.quantity) AS total_revenue,
    SUM(ii.price_per_unit * oi.quantity) AS total_cost_of_ingredients,
    SUM(mi.price * oi.quantity) - SUM(ii.price_per_unit * oi.quantity) AS total_profit
FROM 
    Employee e
LEFT JOIN 
    OrderInfo oi ON e.employee_id = oi.employee_id
LEFT JOIN 
    MenuItem mi ON oi.dish_id = mi.dish_id
LEFT JOIN 
    DishIngredient di ON mi.dish_id = di.dish_id
LEFT JOIN 
    Ingredient ii ON di.ingredient_id = ii.ingredient_id
GROUP BY 
    e.employee_id,
    e.name
ORDER BY 
    total_profit DESC;




SELECT 
    i.ingredient_id, 
    ing.name, 
    i.quantity_in_stock, 
    i.last_restock_date,
    DATEDIFF(CURDATE(), i.last_restock_date) AS days_in_stock
FROM 
    Inventory i
JOIN 
    Ingredient ing ON i.ingredient_id = ing.ingredient_id
WHERE 
    DATEDIFF(CURDATE(), i.last_restock_date) > 30;








