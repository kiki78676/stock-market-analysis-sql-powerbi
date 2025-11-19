
CREATE TABLE dbo.stocks (
    ticker      VARCHAR(10)      NOT NULL,
    [date]      DATE             NOT NULL,
    [open]      DECIMAL(18,6)    NULL,
    [high]      DECIMAL(18,6)    NULL,
    [low]       DECIMAL(18,6)    NULL,
    [close]     DECIMAL(18,6)    NULL,
    [volume]    BIGINT           NULL
);





INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'SPY'       AS ticker,
    [Date]      AS [date],
    [Open]      AS [open],
    [High]      AS [high],
    [Low]       AS [low],
    [Close]     AS [close],
    [Volume]    AS [volume]
FROM dbo.spy;


INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'AAPL',
    [Date],
    [Open],
    [High],
    [Low],
    [Close],
    [Volume]
FROM dbo.aapl;


INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'MSFT',
    [Date],
    [Open],
    [High],
    [Low],
    [Close],
    [Volume]
FROM dbo.msft;


INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'AMZN',
    [Date],
    [Open],
    [High],
    [Low],
    [Close],
    [Volume]
FROM dbo.amzn;

INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'GOOGL',
    [Date],
    [Open],
    [High],
    [Low],
    [Close],
    [Volume]
FROM dbo.googl;


INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'META',
    [Date],
    [Open],
    [High],
    [Low],
    [Close],
    [Volume]
FROM dbo.meta;


INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'JPM',
    [Date],
    [Open],
    [High],
    [Low],
    [Close],
    [Volume]
FROM dbo.jpm;


INSERT INTO dbo.stocks (ticker, [date], [open], [high], [low], [close], [volume])
SELECT
    'XLE',
    [Date],
    [Open],
    [High],
    [Low],
    [Close],
    [Volume]
FROM dbo.xle;


SELECT TOP 20*
FROM dbo.stocks
ORDER BY ticker,[date];


SELECT *
FROM dbo.stocks
ORDER BY ticker,[date];


---- DAILY RETURN
SELECT
   ticker,
   [date],
   [close],
   lag([close]) OVER ( Partition by ticker ORDER BY date) as prev_close,
   CASE
        WHEN
        lag([close]) OVER ( Partition by ticker ORDER BY date) = 0 THEN NULL
        ELSE
        ([close] - lag([close]) OVER ( Partition by ticker ORDER BY date))
        /
        lag([close]) OVER ( Partition by ticker ORDER BY date)
        END AS daily_return
   FROM dbo.stocks
   ORDER BY ticker,[date]

--- CUMULATIVE RETURN (Total Growth Over Time)

SELECT 
    ticker,
    [date],
    [close],
    FIRST_VALUE([close]) OVER (PARTITION BY ticker ORDER BY DATE) as first_close_price,
    CASE
        WHEN
        FIRST_VALUE([close]) OVER (PARTITION BY ticker ORDER BY DATE) = 0 THEN NULL
        ELSE
        ([close]-FIRST_VALUE([close]) OVER (PARTITION BY ticker ORDER BY DATE))
        /
        FIRST_VALUE([close]) OVER (PARTITION BY ticker ORDER BY DATE)
        END AS growth_over_time
    FROM dbo.stocks
    ORDER BY ticker,[date]

;WITH ranking AS (
SELECT
ticker,
[date],
[close],
ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY [date]) as rn
FROM dbo.stocks
),
both_ma AS (
SELECT 
ticker,
[date],
[close],
-- 50-day MA (NULL for first 49 rows)
CASE 
    WHEN 
    rn < 50 THEN NULL
    ELSE
    AVG([close]) over (PARTITION BY ticker ORDER BY [date]
    ROWS BETWEEN 49 PRECEDING AND CURRENT ROW)
END AS ma_50,
 -- 200-day MA (NULL for first 199 rows)
CASE 
    WHEN 
    rn < 200 THEN NULL
    ELSE
    AVG([close]) over (PARTITION BY ticker ORDER BY [date]
    ROWS BETWEEN 199 PRECEDING AND CURRENT ROW)
END AS ma_200
FROM ranking
),
trendies AS(
SELECT 
ticker,
[date],
[close],
ma_50,
ma_200,
CASE 
    WHEN
    ma_50 > ma_200 THEN 'BULLISH'
    WHEN
    ma_50 < ma_200 THEN 'BEARISH'
    ELSE  'NEUTRAL'
END AS Trend_status,
CASE
    WHEN ma_50 > ma_200 THEN 1
    WHEN ma_50 < ma_200 THEN -1
    ELSE 0
END AS trend_signal
FROM both_ma
)
SELECT 
ticker,
[date],
[close],
ma_50,
ma_200,
trend_signal,
LAG(trend_signal) OVER (PARTITION BY ticker ORDER BY date) as prev_signal,
CASE
    WHEN
    LAG(trend_signal) OVER (PARTITION BY ticker ORDER BY date) = -1 AND trend_signal = 1 THEN 'BULLISH_CROSSOVER'
    WHEN
    LAG(trend_signal) OVER (PARTITION BY ticker ORDER BY date) = 1 AND trend_signal = -1 THEN 'BEARISH_CROSSOVER'
    ELSE 'NO EVENT'
END AS corssover_event
FROM trendies
ORDER BY ticker,[date]


;WITH daily AS(
SELECT 
ticker,
[date],
[close],
lag([close]) over (PARTITION BY ticker ORDER BY [date]) as prev_close,
CASE   
    WHEN
    lag([close]) over (PARTITION BY ticker ORDER BY [date]) = 0 THEN NULL
    ELSE
    ([close] - lag([close]) over (PARTITION BY ticker ORDER BY [date]))
    /
    lag([close]) over (PARTITION BY ticker ORDER BY [date])
    END AS daily_return,
CASE
    WHEN ticker IN ('AAPL', 'MSFT', 'AMZN', 'META', 'GOOGL') THEN 'Tech'
    WHEN ticker = 'JPM' THEN 'Financial'
    WHEN ticker = 'XLE' THEN 'Energy'
    WHEN ticker = 'SPY' THEN 'Market'
END AS sector
FROM dbo.stocks
)
SELECT 
ticker,
sector,
STDEV(daily_return) as daily_volatility,
AVG(daily_return) as avg_daily_return,
POWER(1 + AVG(daily_return), 252) - 1 AS annualized_return,
STDEV(daily_return) * SQRT(252) AS annualized_volatility,
--We can assume risk-free rate = 0.02 (2%) for now.
CASE
    WHEN
    STDEV(daily_return) * SQRT(252) IS NULL 
        OR STDEV(daily_return) * SQRT(252) = 0 
        THEN NULL
    ELSE
    ((POWER(1 + AVG(daily_return), 252) - 1)-0.02)
    /
    (STDEV(daily_return) * SQRT(252))
    END AS sharpe_ratio
FROM daily
GROUP BY ticker,sector


