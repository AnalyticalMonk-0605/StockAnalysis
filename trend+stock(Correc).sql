ALTER TABLE trend_long
ADD Corrected_Date DATE;

UPDATE trend_long
SET Corrected_Date =
DATEFROMPARTS(
    YEAR(Date),        -- keep year
    DAY(Date),        -- becomes month
    MONTH(Date)       -- becomes day
);

SELECT TOP 100
Date AS Wrong_Date,
Corrected_Date
FROM trend_long
ORDER BY Corrected_Date;

DELETE FROM trend_long
WHERE Corrected_Date < '2022-09-01';

SELECT tl.Bank,sd.[Date],sd.[Close],tl.Search_Interest INTO tlsd FROM stockdata AS sd
JOIN trend_long AS tl
ON sd.Bank = tl.Bank;

SELECT * FROM tlsd;

SELECT tl.Bank,sd.[Date],sd.[Close],tl.Search_Interest INTO tlssd FROM stockdata AS sd
JOIN trend_long AS tl
ON sd.Bank = tl.Bank
AND sd.Date = tl.Date;

SELECT * FROM tlssd;

SELECT 
    s.[Date],
    s.Bank,
    s.[Close],
    s.Volume,
    ISNULL(t.Search_Interest,0) AS Search_Interest
INTO mergedtlsd
FROM stockdata AS s
OUTER APPLY
(
    SELECT TOP 1 Search_Interest
    FROM trend_long t
    WHERE t.Bank = s.Bank
    AND t.Date <= s.Date
    ORDER BY t.Date DESC
) t;

SELECT * FROM mergedtlsd;
