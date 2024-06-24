-- Insert a new record into Inventory
-- Attempt to insert a record with quantity_in_stock <= 0
select * from Inventory;
UPDATE Inventory
SET quantity_in_stock = 30
WHERE ingredient_id = 1; -- Assuming ingredient_id 1 corresponds to "Eggs"
select * from Inventory
;


-- Call the procedure to add a new reservation
select *from Reservation;
CALL AddNewReservation('2024-04-10 19:00:00', 'John Doe', 4);
select * from Reservation;

SELECT * FROM ProfitableDishes;


select IdentifyProductShortages();


call CalculateExpensesAndProfitability();

call MostReservedHour('2024-04-08');

select FindDishesByIngredient('Eggs');