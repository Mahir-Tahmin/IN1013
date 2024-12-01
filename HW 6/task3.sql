-- 1

SELECT DISTINCT rs.first_name, rs.surname
FROM restBill rb
INNER JOIN restStaff rs ON rb.waiter_no = rs.staff_no
WHERE rb.cust_name = 'Tanya Singh';

-- 2

SELECT rrm.room_date
FROM restRoom_management rrm
INNER JOIN restStaff rs ON rrm.headwaiter = rs.staff_no
WHERE rrm.room_name = 'Green'
  AND rs.first_name = 'Charles'
  AND rrm.room_date BETWEEN 160201 AND 160229;

-- 3

SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
INNER JOIN restStaff zb ON rs.headwaiter = zb.headwaiter
WHERE zb.first_name = 'Zoe' AND zb.surname = 'Ball';

-- 4

SELECT rb.cust_name, rb.bill_total, rs.first_name, rs.surname
FROM restBill rb
INNER JOIN restStaff rs ON rb.waiter_no = rs.staff_no
ORDER BY rb.bill_total DESC;

-- 5

SELECT DISTINCT rs.first_name, rs.surname
FROM restBill rb1
INNER JOIN restBill rb2 ON rb1.table_no = rb2.table_no
INNER JOIN restStaff rs ON rb2.waiter_no = rs.staff_no
WHERE rb1.bill_no IN (00014, 00017);

-- 6 

SELECT rs.first_name, rs.surname
FROM restRoom_management rrm
INNER JOIN restStaff rs ON rrm.headwaiter = rs.staff_no
WHERE rrm.room_name = 'Blue' AND rrm.room_date = 160312

INNER JOIN restBill rb ON rb.table_no = rrm.room_name
INNER JOIN restRest_table rt ON rb.table_no = rt.table_no
WHERE rt.room_name = 'Blue' AND rb.bill_date = 160312;




