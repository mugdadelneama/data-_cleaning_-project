# 🧼 SQL Data Cleaning Project: Layoffs Dataset

## 📌 Objective
Clean a real-world layoff dataset using SQL by identifying and resolving data quality issues such as duplicates, null values, inconsistent formatting, and schema alignment.

## 🛠️ Tools Used
- MySQL
- SQL (CTEs, `UPDATE`, `DELETE`, `ALTER TABLE`, `ROW_NUMBER`, `STR_TO_DATE`)

## 📄 Dataset Overview
- Source Table: `layoffs`
- Working Table: `stage_layoffs_2`
- Context: The dataset includes information on company layoffs, including company name, location, industry, number of employees laid off, percentages, funding stage, and layoff date.

---

## 🧹 Steps Performed

### 1. 🧽 Removing Duplicates
- Created a **staging table** (`stage_layoffs`) to preserve original data.
- Used a **CTE** with `ROW_NUMBER()` window function to find duplicate rows based on multiple fields: `company`, `location`, `industry`, `total_laid_off`, `percentage_laid_off`, `stage`, `country`, and `date`.
- Filtered and removed records with `row_num > 1` to ensure unique entries.

### 2. ✨ Standardizing Data
- **Trimmed whitespace** from company names using `TRIM()`.
- **Corrected inconsistent values**:
  - `'CryptoCurrency'` → `'Crypto'`
  - `'United States.'` → `'United States'`
- **Formatted date values** with `STR_TO_DATE()` to convert from text (MM/DD/YYYY) to proper `DATE` type.
- **Updated schema** with `ALTER TABLE` to store the cleaned `date` column as an actual `DATE`.

### 3. 🚫 Handling Null or Empty Values
- Identified rows with `NULL` in both `total_laid_off` and `percentage_laid_off`.
- Deleted these rows to ensure numeric fields are complete and analysis-ready.

### 4. 🗑️ Removing Unnecessary Columns or Rows
- Dropped the helper column `row_num` after deduplication was complete.
- Removed rows that were irrelevant or incomplete.
- Verified cleaned dataset with final `SELECT` checks.

---

## 📈 Outcome Summary
- ✅ All duplicate entries removed.
- ✅ Industry and country names standardized.
- ✅ All dates are in valid `DATE` format.
- ✅ Null values in critical fields resolved.
- ✅ Dataset is ready for further analysis or visualization.

---

## 📁 Files Included
- `Data_cleaning_project.sql`: Full SQL script with step-by-step cleaning logic.
- *(Optional)* `raw_data_sample.csv`: Sample of original data.
- *(Optional)* `cleaned_data_sample.csv`: Sample after cleaning.

---

## 🧠 Key Skills Demonstrated
- SQL data cleaning and transformation
- Use of CTEs and window functions
- String standardization and date formatting
- Schema updates and data profiling
- Safe handling of nulls and duplicates

---

## 👨‍💻 Author
**Mugdad Elneama**  
Aspiring Data Analyst | Skilled in SQL, EDA, and business-focused insights  
[Your LinkedIn Profile or GitHub Profile Link]
