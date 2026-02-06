UPDATE trend_long
SET Bank = 
CASE
WHEN Bank = 'HDFC_Bank' THEN 'HDFC'
WHEN Bank = 'ICICI_Bank' THEN 'ICICI'
WHEN Bank = 'Axis_Bank' THEN 'Axis'
WHEN Bank = 'Kotak_Mahindra_Bank' THEN 'Kotak'
WHEN Bank = 'State_Bank_of_India' THEN 'Sbi'
ELSE Bank
END;