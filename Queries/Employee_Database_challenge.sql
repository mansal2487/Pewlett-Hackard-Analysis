SELECT emp_no,
first_name,
last_name
FROM employees


SELECT title,
from_date,
to_date
FROM titles

SELECT emp.emp_no, emp.first_name, emp.last_name,
ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as emp
LEFT JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT title, COUNT(title)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


SELECT emp_no,
first_name,
last_name,
birth_date
FROM employees;

SELECT from_date,
to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date,
de.from_date, de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as emp
LEFT JOIN dept_emp as de
ON emp.emp_no = de.emp_no
LEFT JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (ti.to_date = ('9999-01-01'))
ORDER BY emp.emp_no;