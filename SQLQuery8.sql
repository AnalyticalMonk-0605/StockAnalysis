UPDATE stockdata
SET Bank = 
CASE 
WHEN Bank = 'HDFC Bank' THEN 'HDFC'
WHEN Bank = 'ICICI Bank' THEN 'ICICI'
WHEN Bank = 'Axis Bank' THEN 'Axis'
WHEN Bank = 'Kotak Bank' THEN 'Kotak'
WHEN Bank = 'SBI' THEN 'Sbi'
ELSE Bank
END;