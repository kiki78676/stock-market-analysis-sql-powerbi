📈 Stock Market Analysis using SQL & Power BI
A Financial Data Project Featuring Risk, Return, Moving Averages, and Portfolio Insights
🧠 Project Overview

This project analyzes the performance of 8 major U.S. stocks and sector ETFs using SQL for data transformation and Power BI for visualization.

It demonstrates key financial analysis concepts including:

Daily returns

Cumulative growth

Moving average crossovers

Volatility measurement

Risk-adjusted performance (Sharpe Ratio)

Sector comparison (Tech, Financial, Energy, Market Benchmark)

This is a full end-to-end project that showcases data engineering, analytical thinking, and professional dashboard development.

📊 Stocks Included
Ticker	Company / ETF
AAPL	Apple
MSFT	Microsoft
AMZN	Amazon
META	Meta Platforms
GOOGL	Alphabet
JPM	JPMorgan Chase
XLE	Energy Select Sector ETF
SPY	S&P 500 ETF (Benchmark)
🔧 Tech Stack
Component	Technology
Data Source	Stooq Free Stock Data (Daily Prices)
Database	SQL Server
ETL / Data Processing	SQL Window Functions
Data Visualization	Power BI
Version Control	GitHub
File Formats	CSV, PBIX

🛠️ Key SQL Transformations

This project uses advanced SQL to compute:

✔ Daily Return
(close - prev_close) / prev_close

✔ Cumulative Return (Rebased to Initial Price)
(close / first_close) - 1

✔ Moving Averages

50-day MA

200-day MA

✔ Trend Signal

Bullish (MA50 > MA200)

Bearish (MA50 < MA200)

✔ Golden / Death Cross Detection

Using LAG() to detect crossovers.

✔ Risk Metrics

Annualized Return

Daily & Annualized Volatility

Sharpe Ratio

📂 Project Structure
stock-market-analysis-sql-powerbi/
│
├── data/
│   ├── daily_metrics.csv
│   └── summary_metrics.csv
│
├── sql/
│   ├── create_stocks_table.sql
│   ├── insert_stocks.sql
│   ├── daily_metrics_table.sql
│   ├── summary_metrics_query.sql
│
├── powerbi/
│   └── stock_dashboard.pbix
│
├── images/
│   ├── cumulative_returns.png
│   ├── risk_return_scatter.png
│   ├── sharpe_ratio_chart.png
│   └── sector_returns.png
│
└── README.md

📈 Power BI Dashboard Features
🚀 1. Cumulative Return Line Chart

Shows long-term growth rebased to 100.
Highlights outperformers vs the SPY benchmark.

📊 2. Risk vs Return Scatter Plot

X-axis: Volatility

Y-axis: Annualized Return

Bubble size: Market cap (optional)

Color: Sector

📉 3. Sharpe Ratio Ranking

Ranks stocks by risk-adjusted returns.

📑 4. Sector Comparison

Tech vs Financials vs Energy vs Market.

🔁 5. Moving Average Crossover Signals

Golden Cross ↗
Death Cross ↘

💡 Key Insights

Tech stocks (MSFT, AMZN) delivered the best long-term performance.

SPY serves as a stable benchmark with moderate return and low volatility.

Energy (XLE) shows high volatility with inconsistent return profile.

Multiple bullish crossovers indicate trend reversals in major stocks.

AMZN and MSFT have the highest Sharpe ratios → best risk-adjusted performers.

🚀 How to Recreate This Project
1️⃣ Download Data

Use Stooq free data for each ticker (.csv).

2️⃣ Load Into SQL Server

Run:

create table script

insert scripts

daily metrics transformation

summary metrics query

3️⃣ Export results as CSV

daily_metrics.csv

summary_metrics.csv

4️⃣ Build Power BI Dashboard

Load CSV → Create visuals → Publish.

📚 Skills Demonstrated

SQL window functions

Financial analytics

Trend analysis

Time-series modeling

Data cleaning

Data visualization (Power BI)

Git & GitHub

Project documentation

🔮 Future Improvements

Add adjusted close (including dividends)

Build forecasting using Python (ARIMA, Prophet)

Add portfolio optimization (Markowitz)

Automate data refresh via API

🎯 Conclusion

This project demonstrates real-world financial analysis using SQL and Power BI.
It highlights both analytical thinking and technical ability, making it a strong addition to any data analytics or data engineering portfolio.
