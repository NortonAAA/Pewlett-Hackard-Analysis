DROP TABLE retirement_info_challenge;
SELECT emp_no, first_name, last_name
INTO retirement_info_challenge
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');
--Check Table
SELECT * FROM retirement_info_challenge;

-- Joining retirement_info and dept_emp tables
SELECT ric.emp_no,
    ric.first_name,
ric.last_name,
ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM retirement_info_challenge AS ric
LEFT JOIN titles AS ti
ON ric.emp_no = ti.emp_no
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
--verify table for challenge
SELECT * FROM unique_titles;

--Retrieve Employees about to retire
DROP TABLE retiring_titles;
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY (count) DESC;
--Confirm Table Structure in Example
SELECT * FROM retiring_titles;