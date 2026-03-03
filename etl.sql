-- Quantigration RMA ETL (Bulk CSV Ingestion)
-- Note: File paths may vary by environment (Codio/local). Update as needed.

LOAD DATA INFILE '/home/codio/workspace/customers.csv'
INTO TABLE Collaborator
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/codio/workspace/orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/codio/workspace/rma.csv'
INTO TABLE RMA
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
