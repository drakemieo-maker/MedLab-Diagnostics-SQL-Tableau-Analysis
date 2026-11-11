USE MedLab_Nigeria;

SELECT Branch, SUM(Amount_Naira)
FROM Lab_Transactions
WHERE Order_Status = 'Completed'
GROUP BY Branch
ORDER BY SUM(Amount_Naira) DESC;

SELECT Order_Status, COUNT(Transaction_ID), AVG(Turnaround_Hours)
FROM Lab_Transactions
GROUP BY Order_Status
ORDER BY COUNT(Transaction_ID), AVG(Turnaround_Hours) DESC;

SELECT Branch, Order_Status, COUNT(Transaction_ID), SUM(Amount_Naira)
FROM Lab_Transactions
WHERE Order_Status != 'Completed'
GROUP BY Branch, Order_Status
ORDER BY COUNT(Transaction_ID), SUM(Amount_Naira) DESC;

SELECT Doctors_Info.Doctor_Name, Doctors_Info.Branch, AVG(Lab_Transactions.Turnaround_Hours)
FROM Lab_Transactions
INNER JOIN Doctors_Info on Lab_Transactions.Doctor_ID = Doctors_Info.Doctor_ID
GROUP BY Doctors_Info.Doctor_Name,Doctors_Info.Branch
ORDER BY AVG(Lab_Transactions.Turnaround_Hours) DESC;
