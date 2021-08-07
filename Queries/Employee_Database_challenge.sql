--Deliverable 1 Part 1
SELECT DISTINCT ON(emp_no) ee.emp_no,ee.first_name, ee.last_name, tt.from_date,tt.to_date,tt.title
INTO retirement_titles
FROM employees ee
INNER JOIN titles tt
ON ee.emp_no = tt.emp_no
WHERE ee.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ee.emp_no

--Deliverable 1 Part 2
SELECT DISTINCT ON(emp_no) rt.emp_no,rt.first_name, rt.last_name,rt.title
INTO unique_titles
FROM retirement_titles rt
ORDER BY rt.emp_no ASC, rt.to_date DESC

--Deliverable 1 Part 3
SELECT DISTINCT count(title) , title
INTO retiring_titles
FROM retirement_titles
GROUP BY title 
ORDER BY count DESC;

--Deliverable 2 
SELECT DISTINCT ON(emp_no) ee.emp_no, ee.birth_date, ee.first_name, ee.last_name,de.from_date,de.to_date,tt.title
INTO mentorship_eligibilty
FROM employees ee
INNER JOIN dept_emp de
ON ee.emp_no = de.emp_no
INNER JOIN titles tt
ON de.emp_no = tt.emp_no
WHERE (de.to_date >= CURRENT_DATE) AND (ee.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY ee.emp_no
