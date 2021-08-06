-- Use Dictinct with Orderby to remove duplicat
SELECT DISTINCT count(title) , title
INTO retiring_titles
FROM public.RETIREMENT_titles
GROUP BY title 
ORDER BY count DESC;