# 🛍️ Walmart Sales Data Analysis and Dashboard

This project demonstrates a complete data analysis pipeline using a Walmart sales dataset. The process includes data cleaning and transformation in Python, performing business-level analysis using SQL, and building an interactive dashboard in Power BI.

---

## 📁 Project Structure
<pre> ``` WALMART_SALES/ ├── my_venv_walmart/ # Python virtual environment │ ├── Include/ │ ├── Lib/ │ ├── Scripts/ │ └── pyvenv.cfg ├── Data_cleaning.ipynb # Jupyter notebook for data preprocessing ├── requirements.txt # Python dependencies ├── sql_queries.sql # Business analysis SQL queries ├── Walmart_cleaned.csv # Cleaned dataset ready for SQL/BI ├── walmart_sales_visualisation.pbix # Power BI dashboard ├── walmart-10k-sales-datasets.zip # Original dataset (zipped) └── Walmart.csv # Raw dataset (extracted) ``` </pre>

## 🧰 Technologies Used

- **Python** – Data cleaning & preprocessing
- **MySQL** – Data analysis with SQL
- **Power BI** – Data visualization and dashboard creation
- **VS Code** – Development environment with Jupyter extension
- **Libraries Used:**
  - `pandas` – for data manipulation
  - `numpy` – for numerical operations
  - `sqlalchemy` – for SQL connection/ORM
  - `pymysql` – to connect Python with MySQL

## 📊 Dataset Info

- **Source**: [Kaggle - Walmart 10K Sales Dataset](https://www.kaggle.com/datasets/najir0123/walmart-10k-sales-datasets)
- **Rows**: 10,000  
- **Columns**:
  - `invoice_id` – Unique identifier for each transaction
  - `Branch` – Store branch (A, B, or C)
  - `City` – City where the store is located
  - `Category` – Product category sold
  - `unit_price` – Price per unit of the item
  - `quantity` – Quantity of items sold
  - `date` – Date of transaction
  - `time` – Time of transaction
  - `payment_method` – Type of payment used
  - `rating` – Customer rating (1–10 scale)
  - `profit_margin` – Profit earned on transaction

## 🔧 Step-by-Step Workflow

### ✅ Step 1: Data Collection
- Downloaded the dataset from Kaggle.
- Extracted the raw dataset as `Walmart.csv`.

### 🧹 Step 2: Data Cleaning & Feature Engineering (Python)
- Environment setup with Jupyter in VS Code.
- Created a virtual environment and added a `requirements.txt` with all dependencies.
- Used `pandas` and `numpy` for data preprocessing:
  - Checked for null values — filled `unit_price` and `quantity` with mean values.
  - Removed duplicates.
  - Fixed incorrect data types.
  - Added a new column `Total_Amount = unit_price * quantity`.
- Exported the cleaned data to `Walmart_cleaned.csv`.

### 🛢️ Step 3: Data Analysis (MySQL)
- Created a database in MySQL.
- Connected Python to MySQL using SQLAlchemy and PyMySQL.
- Loaded the cleaned data into MySQL.
- Wrote SQL queries to analyze business problems such as:
  - Most used payment methods
  - Highest-rated categories per branch
  - Busiest sales days
  - Average, min, max ratings by city/category
  - Sales categorized by shift (Morning, Afternoon, Evening)
  - Branches with the highest revenue drop year over year

### 📊 Step 4: Data Visualization (Power BI)
- Connected Power BI to MySQL database using credentials.
- Imported results from SQL queries to visualize:
  - Sales trends by category, day, branch
  - Rating and revenue comparisons
  - Preferred payment methods
  - Year-wise revenue differences
- Created an interactive dashboard (`walmart_sales_visualisation.pbix`)
  
## 🚀 Getting Started

Follow these steps to set up and run the project on your local machine:



