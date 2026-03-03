-- Quantigration RMA Change & Maintenance Operations
-- Demonstrates controlled updates, deletes, and requirement-driven changes

-- =====================================
-- 1. Controlled Update Example
-- =====================================
-- Business case: Return completed and customer credit issued

UPDATE RMA
SET Status = 'Complete',
    Step = 'Credit Customer Account'
WHERE Order_ID = 5175;


-- =====================================
-- 2. Controlled Delete Example
-- =====================================
-- Business case: Remove rejected return requests from the RMA workflow

DELETE FROM RMA
WHERE Reason LIKE '%Rejected%';


-- =====================================
-- 3. Requirement Change (Customer → Collaborator)
-- =====================================
-- Note: Depending on your environment, this change can be implemented by:
-- (A) Renaming the Customer table to Collaborator, OR
-- (B) Creating a new Collaborator table and migrating data.
-- The commands below reflect common approaches.

-- A) Rename table (if applicable)
-- RENAME TABLE Customers TO Collaborator;

-- B) If renaming columns/keys is needed, update FK references accordingly:
-- ALTER TABLE Orders DROP FOREIGN KEY <fk_name>;
-- ALTER TABLE Orders CHANGE Customer_ID Collaborator_ID INT;
-- ALTER TABLE Orders
--     ADD CONSTRAINT <fk_name>
--     FOREIGN KEY (Collaborator_ID) REFERENCES Collaborator(Collaborator_ID);

-- Optional: Create a view to present Customer as Collaborator for reporting
-- (Useful when underlying schema cannot be renamed)
-- CREATE OR REPLACE VIEW Collaborator_View AS
-- SELECT Customer_ID AS Collaborator_ID, First_Name, Last_Name, Street, City, State, ZipCode, Telephone
-- FROM Customers;
