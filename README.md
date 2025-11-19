# 📘 Stock Market Analysis Using SQL & Power BI

A complete financial analytics project calculating returns, volatility, Sharpe ratios, moving averages, and trend signals for major U.S. stocks.

## 🔹 1. Project Description

This project analyzes historical stock price data from 8 major companies and sector ETFs using SQL Server and visualizes insights using Power BI.

The goal is to build a data-driven portfolio performance dashboard showing:

Stock returns

Market trends

Moving average crossovers

Sector performance

Risk vs return behavior

Sharpe ratio analysis

## 🔹 2. Objectives

The project answers the following key business questions:

✔ Which stocks performed best over time?
✔ Which stocks offer the best risk-adjusted returns (Sharpe Ratio)?
✔ When did bullish/bearish moving average crossovers occur?
✔ How do sectors compare against the SPY benchmark?
✔ Which stocks are the most volatile?
## 🔹 3. Dataset Overview

The dataset comes from Stooq Free Stock Data (CSV files).
Daily historical data includes:

Date

Open

High

Low

Close

Volume

Stocks analyzed:

AAPL

MSFT

AMZN

META

GOOGL

JPM

XLE

SPY (benchmark)

## 🔹 4. Technologies Used
Category	Tools
Database	SQL Server
Data Processing	SQL Window Functions
Visualization	Power BI
Version Control	Git & GitHub
File Format	CSV
Data Source	Stooq
## 🔹 5. SQL Transformations Performed
5.1 Daily Returns

Calculated using LAG function:

(close - prev_close) / prev_close

5.2 Cumulative Returns

Rebased to initial price:

(close / first_close) - 1

5.3 Moving Averages

50-day moving average

200-day moving average

5.4 Trend Signals

Bullish → MA50 > MA200

Bearish → MA50 < MA200

5.5 Crossover Events

Golden Cross

Death Cross

5.6 Risk Metrics

Annualized return

Annualized volatility

Sharpe ratio

## 🔹 6. Power BI Dashboard Features
6.1 Cumulative Returns Line Chart

Shows long-term growth of each stock vs SPY.

6.2 Risk vs Return Scatter Plot

Visualizes how volatility relates to performance.

6.3 Sharpe Ratio Ranking

Ranks stocks by risk-adjusted returns.

6.4 Sector Comparison Chart

Tech vs Financial vs Energy vs Benchmark.

6.5 Moving Average Trend Signals

Identifies market momentum changes.

## 🔹 7. Project Structure
stock-market-analysis-sql-powerbi/
│
├── data/
│   ├── summary_metrics.csv
│   └── daily_metrics.csv
│
├── sql/
│   ├── create_stocks_table.sql
│   ├── insert_stocks.sql
│   ├── daily_metrics_table.sql
│   └── summary_metrics_query.sql
│
├── powerbi/
│   └── stock_dashboard.pbix
│
├── images/
│   ├── cumulative_returns.png
│   ├── risk_return.png
│   ├── sharpe_ratio.png
│   └── sector_chart.png
│
└── README.md

## 🔹 8. Key Insights
✔ Tech sector outperformed all other sectors
✔ MSFT and AMZN showed best risk-adjusted performance
✔ SPY provides steady, low-risk growth
✔ XLE (Energy) has the highest volatility
✔ Multiple bullish crossovers were detected in major stocks
## 🔹 9. How to Reproduce the Project
Step 1: Download CSV stock data from Stooq
Step 2: Load data into SQL Server
Step 3: Run SQL scripts to generate metrics
Step 4: Export results to CSV
Step 5: Load CSV files into Power BI
Step 6: Build dashboard from visuals
## 🔹 10. Skills Demonstrated

SQL window functions

Time-series analysis

Data cleaning & transformation

Financial analytics

Power BI visualization

Data modeling

GitHub documentation

Trend and signal detection

## 🔹 11. Future Enhancements

Add dividend-adjusted returns

Add forecasting (ARIMA, Prophet)

Build real-time API data refresh

Add portfolio optimization (Markowitz Model)

## 🔹 12. Conclusion

This end-to-end financial analytics project demonstrates strong skills in SQL, data processing, visualization, and financial interpretation.
It replicates real-world stock analysis used by analysts, data engineers, and portfolio managers.
