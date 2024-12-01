-- 1

SELECT DISTINCT b.cust_name
FROM restBill b
INNER JOIN restStaff s ON b.waiter_no = s.staff_no
INNER JOIN restRoom_management rrm ON b.table_no = rrm.room_name AND b.bill_date = rrm.room_date
WHERE s.headwaiter = 010
AND b.bill_total > 450.00;

-- 2

SELECT s.first_name, s.surname
FROM restBill b
INNER JOIN restStaff s ON b.waiter_no = s.staff_no
INNER JOIN restRoom_management rrm ON b.table_no = rrm.room_name AND b.bill_date = rrm.room_date
WHERE b.cust_name = 'Nerida Smith'
AND b.bill_date = 160111
AND rrm.headwaiter = s.headwaiter;

-- 3

SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4

SELECT s.first_name, s.surname
FROM restStaff s
LEFT JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.bill_no IS NULL;

-- 5

SELECT b.cust_name, s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, rrm.room_name
FROM restBill b
INNER JOIN restStaff s ON b.waiter_no = s.staff_no
INNER JOIN restRoom_management rrm ON b.table_no = rrm.room_name AND b.bill_date = rrm.room_date
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);


