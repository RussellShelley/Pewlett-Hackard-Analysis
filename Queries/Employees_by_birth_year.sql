


SELECT 
DATE_TRUNC('year', e.birth_date),
COUNT (e.emp_no)
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no =de.emp_no) AND (de.to_date = '9999-01-01')
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no AND ti.to_date = '9999-01-01')
GROUP BY DATE_TRUNC('year', e.birth_date)
ORDER BY DATE_TRUNC('year', e.birth_date)
  
