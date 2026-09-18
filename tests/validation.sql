USE property_management;

-- ============================================================
-- PROPERTY MANAGEMENT & REAL ESTATE ANALYTICS
-- Database Validation / Data Quality Checks
-- ============================================================


-- 1. Check expected record counts
SELECT 'Properties' AS table_name, COUNT(*) AS record_count
FROM properties

UNION ALL

SELECT 'Units', COUNT(*)
FROM units

UNION ALL

SELECT 'Tenants', COUNT(*)
FROM tenants

UNION ALL

SELECT 'Employees', COUNT(*)
FROM employees

UNION ALL

SELECT 'Leases', COUNT(*)
FROM leases

UNION ALL

SELECT 'Payments', COUNT(*)
FROM payments

UNION ALL

SELECT 'Maintenance Requests', COUNT(*)
FROM maintenance_requests

UNION ALL

SELECT 'Expenses', COUNT(*)
FROM expenses;


-- 2. Check for duplicate Property IDs
SELECT property_id, COUNT(*) AS duplicate_count
FROM properties
GROUP BY property_id
HAVING COUNT(*) > 1;


-- 3. Check for duplicate Unit IDs
SELECT unit_id, COUNT(*) AS duplicate_count
FROM units
GROUP BY unit_id
HAVING COUNT(*) > 1;


-- 4. Check for duplicate Tenant IDs
SELECT tenant_id, COUNT(*) AS duplicate_count
FROM tenants
GROUP BY tenant_id
HAVING COUNT(*) > 1;


-- 5. Check for units referencing non-existent properties
SELECT u.unit_id, u.property_id
FROM units u
LEFT JOIN properties p
    ON u.property_id = p.property_id
WHERE p.property_id IS NULL;


-- 6. Check for leases referencing non-existent units
SELECT l.lease_id, l.unit_id
FROM leases l
LEFT JOIN units u
    ON l.unit_id = u.unit_id
WHERE u.unit_id IS NULL;


-- 7. Check for leases referencing non-existent tenants
SELECT l.lease_id, l.tenant_id
FROM leases l
LEFT JOIN tenants t
    ON l.tenant_id = t.tenant_id
WHERE t.tenant_id IS NULL;


-- 8. Check for payments referencing non-existent leases
SELECT p.payment_id, p.lease_id
FROM payments p
LEFT JOIN leases l
    ON p.lease_id = l.lease_id
WHERE l.lease_id IS NULL;


-- 9. Check for maintenance requests referencing non-existent units
SELECT mr.request_id, mr.unit_id
FROM maintenance_requests mr
LEFT JOIN units u
    ON mr.unit_id = u.unit_id
WHERE u.unit_id IS NULL;


-- 10. Check for maintenance requests referencing non-existent employees
SELECT mr.request_id, mr.employee_id
FROM maintenance_requests mr
LEFT JOIN employees e
    ON mr.employee_id = e.employee_id
WHERE e.employee_id IS NULL;


-- 11. Check for expenses referencing non-existent properties
SELECT ex.expense_id, ex.property_id
FROM expenses ex
LEFT JOIN properties p
    ON ex.property_id = p.property_id
WHERE p.property_id IS NULL;


-- 12. Check for invalid lease dates
SELECT lease_id, start_date, end_date
FROM leases
WHERE end_date < start_date;


-- 13. Check for invalid payment amounts
SELECT payment_id, amount
FROM payments
WHERE amount < 0;


-- 14. Check for invalid expense amounts
SELECT expense_id, amount
FROM expenses
WHERE amount < 0;


-- 15. Check for invalid monthly rent
SELECT unit_id, monthly_rent
FROM units
WHERE monthly_rent < 0;


-- 16. Check for orphan maintenance records
SELECT mr.request_id
FROM maintenance_requests mr
LEFT JOIN units u
    ON mr.unit_id = u.unit_id
WHERE u.unit_id IS NULL;


-- 17. Check for active leases with invalid dates
SELECT lease_id, unit_id, tenant_id, start_date, end_date
FROM leases
WHERE status = 'Active'
  AND (start_date IS NULL OR end_date IS NULL);


-- 18. Check for payments with invalid status
SELECT payment_id, payment_status
FROM payments
WHERE payment_status NOT IN ('Paid', 'Pending', 'Failed');


-- 19. Check for maintenance requests with invalid status
SELECT request_id, status
FROM maintenance_requests
WHERE status NOT IN ('Open', 'In Progress', 'Completed');


-- 20. Check for units with invalid status
SELECT unit_id, status
FROM units
WHERE status NOT IN ('Occupied', 'Vacant', 'Under Maintenance');


-- ============================================================
-- VALIDATION COMPLETE
-- Empty result sets for integrity checks indicate no detected
-- data-quality or referential-integrity problems.
-- ============================================================
