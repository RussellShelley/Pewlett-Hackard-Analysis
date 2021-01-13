--Number of retiring employees by title.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles	
FROM employees as e
INNER JOIN titles as ti
On (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT (DISTINCT title)
FROM unique_titles;

---Create count of retiring titles
SELECT COUNT (DISTINCT emp_no ),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

