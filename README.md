## 🗂️ Project Structure

```
Data_Analyst_Assignment/
│
├── SQL/
│   ├── 01_Hotel_Schema_Setup.sql
│   ├── 02_Hotel_Queries.sql
│   ├── 03_Clinic_Schema_Setup.sql
│   └── 04_Clinic_Queries.sql
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
│
├── Python/
│   ├── 01_Time_Converter.py
│   └── 02_Remove_Duplicates.py
│
└── README.md
```

---

## 🧠 SQL Tasks

### Hotel Management System

* Designed relational schema with proper keys and constraints
* Implemented queries to:

  * Retrieve latest bookings per user
  * Calculate billing amounts
  * Identify high-value transactions
  * Analyze item demand trends
  * Rank customers based on spending

### Clinic Management System

* Built schema for clinics, customers, sales, and expenses
* Performed business-focused analysis:

  * Revenue by sales channel
  * Top customers by revenue
  * Monthly profit & loss analysis
  * Most/least profitable clinics by region

👉 All queries are written with proper joins, aggregations, and window functions where required.

---

## 📊 Spreadsheet Tasks

* Used Excel to perform data linking and time-based analysis
* Implemented:

  * Lookup operations using `VLOOKUP` / `INDEX-MATCH`
  * Helper columns for same day and same hour comparisons
  * Conditional counting using `COUNTIFS`
  * Optional pivot tables for outlet-level insights

👉 Focus: operational efficiency analysis (ticket resolution performance)

---

## 🐍 Python Tasks

### 1. Time Converter

* Converts minutes into human-readable format (hours + minutes)
* Handles edge cases like zero or invalid input

### 2. Remove Duplicates from String

* Iteratively removes duplicate characters using loops
* Maintains order of first occurrence

👉 Focus: clean logic and readability

---

## 🔍 Key Insights

* Revenue concentration can be identified at booking and channel level
* Profitability varies significantly when expenses are considered alongside revenue
* Certain items/services dominate demand, indicating optimization opportunities
* High-value customers can be targeted for retention and upselling
* Operational efficiency can be measured through same-day/hour ticket resolution

---

## ⚙️ How to Run

### SQL

1. Execute `Schema_Setup.sql` files to create tables and insert data
2. Run queries from corresponding `Queries.sql` files

### Excel

* Open `Ticket_Analysis.xlsx`
* Ensure formulas and references are intact

### Python


*  01_Time_Converter.py
*  02_Remove_Duplicates.py


---

## ✅ Notes

* Queries are independent and can be executed individually
* Sample data is minimal and designed for demonstration
* Focus is on correctness, clarity, and analytical thinking

---

##  Summary

This assignment showcases the ability to:

* Structure and query relational data
* Extract actionable insights from datasets
* Apply logical thinking across tools

** Emphasis is placed on **translating raw data into meaningful decisions**
