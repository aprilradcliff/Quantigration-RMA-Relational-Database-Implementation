# Quantigration RMA Relational Database Implementation  
### Schema Design, ETL Workflow, Data Integrity & Analytical Queries  

## Project Overview

This project implements a fully relational MySQL database for a Return Merchandise Authorization (RMA) system.

The system was designed and built from an entity relationship diagram (ERD) and includes full schema creation, referential integrity enforcement, bulk data ingestion, controlled updates and deletes, analytical KPI queries, and CSV export functionality.

This project demonstrates end-to-end relational database implementation and business data analysis.

---

## Technologies Used

- MySQL
- SQL (DDL & DML)
- Primary and Foreign Key constraints
- LOAD DATA INFILE (Bulk CSV ingestion)
- INNER JOIN & LEFT JOIN
- Aggregation (COUNT, GROUP BY)
- Conditional filtering (WHERE, LIKE, IN)
- Schema modification (ALTER TABLE)
- View creation
- Data export to CSV

---

## Database Architecture

### Core Tables

**Collaborator**  
Stores customer entity data (renamed from Customer after requirements change).

**Orders**  
Stores order data and references Collaborator via foreign key.

**RMA**  
Stores return authorization records and references Orders via foreign key.

---

## Relational Integrity

- One-to-Many: Collaborator → Orders  
- One-to-Many: Orders → RMA  
- Primary keys enforced on all tables  
- Foreign key constraints enforced for data integrity  

---

## ETL Implementation

Data was bulk loaded into the database using `LOAD DATA INFILE` from structured CSV files for:

- Collaborator
- Orders
- RMA

This simulates a real-world ETL workflow for structured business data ingestion.

---

## Functional Operations Demonstrated

- Schema creation from ERD
- Primary and foreign key implementation
- Record insertion
- Controlled updates and deletes
- Requirements change implementation (Customer → Collaborator)
- Analytical KPI queries (sales volume, returns by product/state)
- Percentage-based return analysis
- Data export to flat CSV file

---

## Key Analytical Capabilities

- Sales volume by state
- Return count by SKU
- Percentage of returns company-wide
- Join-based reporting across relational tables
- Business risk identification from data trends

---

## Outcome

This implementation demonstrates the ability to design, modify, populate, and analyze a relational database while preserving referential integrity and adapting to evolving business requirements.

The project reflects practical database engineering and analytical SQL competency suitable for business intelligence, data analytics, and entry-level database development roles.
