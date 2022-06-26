Question 1:

mysql> SELECT t.title, COUNT(*) AS "Number of Employees" FROM titles AS t INNER JOIN employees AS e ON
    -> e.emp_no = t.emp_no WHERE  e.birth_date > '1965-01-01'
    -> GROUP BY t.title;

+--------------------+---------------------+
| title              | Number of Employees |
+--------------------+---------------------+
| Senior Staff       |                 612 |
| Staff              |                 703 |
| Technique Leader   |                  95 |
| Senior Engineer    |                 589 |
| Engineer           |                 657 |
| Assistant Engineer |                  97 |
+--------------------+---------------------+
6 rows in set (0.09 sec)

Question 2:
mysql> SELECT t.title, avg(salary) FROM titles AS t
    -> INNER JOIN employees AS e ON e.emp_no = t.emp_no
    -> INNER JOIN salaries s on s.emp_no = t.emp_no
    -> GROUP BY t.title;

+--------------------+-------------+
| title              | avg(salary) |
+--------------------+-------------+
| Senior Engineer    |  60543.2191 |
| Staff              |  69308.7124 |
| Engineer           |  59508.0751 |
| Senior Staff       |  70470.5013 |
| Assistant Engineer |  59304.9863 |
| Technique Leader   |  59294.3742 |
| Manager            |  66924.2706 |
+--------------------+-------------+
7 rows in set (7.04 sec)

Question 3:

mysql> SELECT sum(s.salary), d.dept_name FROM salaries s
    -> INNER JOIN dept_emp de ON de.emp_no = s.emp_no
    -> INNER JOIN departments d ON d.dept_no = de.dept_no
    -> WHERE dept_name = "Marketing" AND de.from_date >= '1990-01-01' AND de.to_date <= '1992-12-31';

+---------------+-----------+
| sum(s.salary) | dept_name |
+---------------+-----------+
|      54989098 | Marketing |
+---------------+-----------+
1 row in set (0.05 sec)
