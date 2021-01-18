SELECT
DATE_TRUNC('year', e.birth_date),
ti.title,
COUNT (ti.title)
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no =de.emp_no) AND (de.to_date = '9999-01-01')
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no AND ti.to_date = '9999-01-01')
AND (birth_date BETWEEN '1963-01-01' AND '1965-12-31')
GROUP BY DATE_TRUNC('year', e.birth_date), ti.title
ORDER BY DATE_TRUNC('year', e.birth_date), ti.title