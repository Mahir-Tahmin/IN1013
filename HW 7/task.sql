-- 1

CREATE VIEW samsBills AS
SELECT s.first_name, s.surname, b.bill_date, b.cust_name, b.bill_total
FROM restBill b
INNER JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE s.first_name = 'Sam' AND s.surname = 'Pitt';

-- 2

SELECT *
FROM samsBills
WHERE bill_total > 400;

-- 3

CREATE VIEW roomTotals AS
SELECT rt.room_name, SUM(b.bill_total) AS total_sum
FROM restBill b
INNER JOIN restRest_table t ON b.table_no = t.table_no
INNER JOIN restRoom_management rt ON t.room_name = rt.room_name
GROUP BY rt.room_name;

-- 4

CREATE VIEW teamTotals AS
SELECT CONCAT(h.first_name, ' ', h.surname) AS headwaiter_name, SUM(b.bill_total) AS total_sum
FROM restBill b
INNER JOIN restStaff w ON b.waiter_no = w.staff_no
INNER JOIN restStaff h ON w.headwaiter = h.staff_no
GROUP BY h.first_name, h.surname;



