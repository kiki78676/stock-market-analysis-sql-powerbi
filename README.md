# 📈 Stock Market Analysis Using SQL & Power BI
A complete end-to-end financial analytics and visualization project
## 🔷 Overview

This project analyzes the performance of major U.S. stocks using SQL Server for data transformation and Power BI for interactive dashboards.
It includes daily returns, cumulative returns, moving averages, volatility, Sharpe ratio, and trend signals such as bullish/bearish crossovers.

This project replicates real financial workflows used by data analysts, BI developers, and quant analysts.

## 🔷 Goals of the Project

Analyze long-term and short-term stock performance

Build a reusable SQL pipeline for financial time-series data

Generate actionable metrics such as returns, volatility, Sharpe ratio

Identify market trends using moving averages

Visualize insights with a professional Power BI dashboard

Compare stocks vs the SPY benchmark

Compare sector performance (Tech, Financial, Energy)

## 🔷 Stocks Included
Sector	Ticker	Company
Tech	AAPL	Apple
Tech	MSFT	Microsoft
Tech	AMZN	Amazon
Tech	META	Meta Platforms
Tech	GOOGL	Alphabet
Financial	JPM	JPMorgan Chase
Energy	XLE	Energy Select Sector ETF
Market Benchmark	SPY	S&P 500 ETF
## 🔷 Technologies Used
🗄 SQL Server

Data Cleaning

Window Functions

LAG, FIRST_VALUE

Moving Averages (50, 200)

Trend detection (bullish/bearish crossover)

Volatility & Sharpe ratio

📊 Power BI

Cumulative Return Visualization

Risk vs Return Scatter Plot

Sharpe Ratio Bar Chart

Sector Comparison Analysis

Trend Signal Table

🧰 Additional Tools

CSV Data (Stooq)

Git & GitHub

DAX (basic formatting inside Power BI)

## 🔷 SQL Transformations
### 📌 1. Daily Returns

Using LAG() to compare today’s close vs yesterday’s.

(close - previous_close) / previous_close

### 📌 2. Cumulative Return (Growth Over Time)

Rebased to the first closing price:

(close / first_close) - 1

### 📌 3. Moving Averages

50-day moving average

200-day moving average

Using SQL window frames:

ROWS BETWEEN 49 PRECEDING AND CURRENT ROW

### 📌 4. Trend Classification

Bullish → MA50 > MA200

Bearish → MA50 < MA200

Neutral → MA50 = MA200

### 📌 5. Crossover Events

Golden Cross → MA50 crosses above MA200

Death Cross → MA50 crosses below MA200

### 📌 6. Risk Metrics

Annualized Return → Compounded from average daily return

Daily Volatility → STDEV of daily returns

Annualized Volatility → Daily volatility × √252

Sharpe Ratio → Risk-adjusted performance

## 🔷 Power BI Dashboard Features
### 📊 1. Cumulative Return Line Chart

Shows long-term stock growth

Benchmarked against SPY

Identifies outperformers clearly

### 📊 2. Risk vs Return Scatter Plot

X-axis: Annualized Volatility

Y-axis: Annualized Return

Helps identify high-risk vs high-reward stocks

### 📊 3. Sharpe Ratio Chart

Ranks stocks by risk-adjusted return

Useful for balanced portfolio selection

### 📊 4. Sector Comparison Chart

Tech vs Financial vs Energy vs Market

Shows industry-level patterns

### 📊 5. Moving Average Crossover Table

Flags bullish & bearish crossover dates

Helps identify momentum shifts

## 🔷 Key Insights

MSFT & AMZN show strongest performance over time

SPY provides stable low-risk returns, ideal benchmark

Tech sector outperforms Energy and Financial sectors

Golden Cross events align with strong upward trends

XLE (Energy) has high volatility but inconsistent return

Sharpe Ratio identifies MSFT/AMZN as best risk-adjusted picks

## 🔷 How to Recreate the Project
1️⃣ Download stock data (CSV) from Stooq
2️⃣ Load CSVs into SQL Server
3️⃣ Run SQL transformation scripts
4️⃣ Export daily_metrics & summary_metrics
5️⃣ Load into Power BI
6️⃣ Build the interactive dashboard
## 🔷 Skills Demonstrated

SQL Window Functions

Time-Series Data Analysis

Power BI Dashboard Design

Crossover Trend Detection

Financial KPIs (Sharpe, Volatility, Returns)

Data Modeling

Git/GitHub Project Structuring

Documentation & Presentation

## 🔷 Future Improvements

Add dividend-adjusted returns

Add forecasting model (Prophet/ARIMA)

Build automated refresh pipeline

Add sector-weighted portfolio optimization

## 🔷 Conclusion

This project showcases end-to-end analytical capability:
from data ingestion → SQL transformation → modeling → visualization → insights.
It demonstrates skills in financial analytics, BI reporting, and technical data handling — making it a strong portfolio piece for data analytics or data engineering roles.
