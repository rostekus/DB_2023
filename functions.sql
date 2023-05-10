-- FUNCTION TO CALCULATE YEARLY SALARY

CREATE OR REPLACE FUNCTION calculate_yearly_salary (p_employee_id IN employees.employee_id%TYPE)
RETURN NUMBER
IS
  v_salary employees.salary%TYPE;
BEGIN
  -- Get the employee's salary
  SELECT salary INTO v_salary
  FROM employees
  WHERE employee_id = p_employee_id;

  -- Calculate and return the yearly salary
  RETURN v_salary * 12;
END;

-- CHECK
-- SELECT calculate_yearly_salary(2) AS yearly_salary FROM dual;
--

-- FUNCTION TO CALCULATE

CREATE OR REPLACE FUNCTION calculate_total_spendings (p_customer_id IN Customers.customer_id%TYPE)
RETURN NUMBER
IS
  v_total_spending Orders.total_amount%TYPE := 0;
BEGIN
  -- Sum up the total amount for all orders made by the customer
  SELECT SUM(total_amount) INTO v_total_spending
  FROM Orders
  WHERE customer_id = p_customer_id;

  -- Return the total spending
  RETURN v_total_spending;
END;


-- FUNCTION TO CALCULATE AVERAGE SPENDING

CREATE OR REPLACE FUNCTION calculate_average_spending (p_customer_id IN Customers.customer_id%TYPE)
RETURN NUMBER
IS
  v_average_spending Orders.total_amount%TYPE := 0;
BEGIN
  -- Calculate the average total amount for all orders made by the customer
  SELECT AVG(total_amount) INTO v_average_spending
  FROM Orders
  WHERE customer_id = p_customer_id;

  -- Return the average spending
  RETURN v_average_spending;
END;


-- FUNCTION TO SUM RESTAURANT'S EARNINGS IN A GIVE PERIOD

CREATE OR REPLACE FUNCTION calculate_earnings (p_period IN VARCHAR)
  RETURN NUMBER
IS
  total_earned NUMBER := 0;
BEGIN
  CASE
    WHEN p_period = 'week' THEN
      SELECT SUM(total_amount)
      INTO total_earned
      FROM orders
      WHERE order_date BETWEEN TRUNC(SYSDATE) - 7 AND TRUNC(SYSDATE);
      
      WHEN p_period = 'month' THEN
      SELECT SUM(total_amount)
      INTO total_earned
      FROM orders
      WHERE order_date BETWEEN TRUNC(SYSDATE, 'MONTH') - 1 AND LAST_DAY(TRUNC(SYSDATE, 'MONTH') - 1);

      WHEN p_period = 'year' THEN
      SELECT SUM(total_amount)
      INTO total_earned
      FROM orders
      WHERE order_date BETWEEN ADD_MONTHS(TRUNC(SYSDATE, 'YEAR'), -12) AND TRUNC(SYSDATE);
      
      
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 'Invalid period: ' || p_period);
  END CASE;

  RETURN total_earned;
END;
