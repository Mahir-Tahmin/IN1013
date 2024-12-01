-- 1

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
INNER JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2

SELECT r.room_name, COUNT(rt.table_no) AS num_tables
FROM restRest_table rt
INNER JOIN restRoom_management r ON rt.room_name = r.room_name
WHERE rt.no_of_seats > 6
GROUP BY r.room_name;

-- 3

SELECT r.room_name, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
INNER JOIN restRoom_management rrm ON b.table_no = rrm.room_name
GROUP BY rrm.room_name;

-- 4

SELECT s.first_name, s.surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff s
INNER JOIN restStaff w ON s.staff_no = w.headwaiter
INNER JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY s.first_name, s.surname
ORDER BY total_bill_amount DESC;

-- 5

SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
INNER JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;
