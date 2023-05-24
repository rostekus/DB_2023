-- FUNCTION TO CALCULATE YEARLY SALARY

CREATE OR REPLACE FUNCTION calculate_yearly_salary (p_employee_id IN employees.employee_id%TYPE)
RETURN NUMBER
IS
  v_salary employees.salary%TYPE;
BEGIN
	-- Validate the employee_id parameter
	IF p_employee_id IS NULL THEN
	RAISE_APPLICATION_ERROR(-20001, 'Employee ID cannot be null.');
	END IF;

  -- Get the employee's salary
  SELECT salary INTO v_salary
  FROM employees
  WHERE employee_id = p_employee_id;

	-- Validate if employee exists
	IF v_salary IS NULL THEN
	RAISE_APPLICATION_ERROR(-20002, 'Employee with ID ' || p_employee_id || ' does not exist.');
	END IF;

  -- Calculate and return the yearly salary
  RETURN v_salary * 12;
	EXCEPTION
	WHEN OTHERS THEN
	-- Handle any other exceptions
	RAISE; -- Reraise the exception for further handling at a higher level


END;

-- CHECK
-- SELECT calculate_yearly_salary(2) AS yearly_salary FROM dual;
--

-- FUNCTION TO CALCULATE TOTAL SPENDINGS

CREATE OR REPLACE FUNCTION calculate_total_spendings (p_customer_id IN Customers.customer_id%TYPE)
RETURN NUMBER
IS
  v_total_spending Orders.total_amount%TYPE := 0;
BEGIN
	-- Validate the customer_id parameter
	IF p_customer_id IS NULL THEN
	RAISE_APPLICATION_ERROR(-20001, 'Customer ID cannot be null.');
	END IF;

  -- Sum up the total amount for all orders made by the customer
  SELECT SUM(total_amount) INTO v_total_spending
  FROM Orders
  WHERE customer_id = p_customer_id;

	-- Validate if customer exists
	IF v_total_spending IS NULL THEN
	RAISE_APPLICATION_ERROR(-20002, 'Customer with ID ' || p_customer_id || ' does not exist.');
	END IF;

  -- Return the total spending
  RETURN v_total_spending;
	EXCEPTION
	WHEN OTHERS THEN
	-- Handle any other exceptions
	RAISE; -- Reraise the exception for further handling at a higher level
END;



-- FUNCTION TO CALCULATE AVERAGE SPENDING

CREATE OR REPLACE FUNCTION calculate_average_spending (p_customer_id IN Customers.customer_id%TYPE)
RETURN NUMBER
IS
  v_average_spending Orders.total_amount%TYPE := 0;
BEGIN
	-- Validate the customer_id parameter
	IF p_customer_id IS NULL THEN
	RAISE_APPLICATION_ERROR(-20001, 'Customer ID cannot be null.');
	END IF;

  -- Calculate the average total amount for all orders made by the customer
  SELECT AVG(total_amount) INTO v_average_spending
  FROM Orders
  WHERE customer_id = p_customer_id;
  
  -- Validate if customer exists
	IF v_average_spending IS NULL THEN
	RAISE_APPLICATION_ERROR(-20002, 'Customer with ID ' || p_customer_id || ' does not exist.');
	END IF;

  -- Return the average spending
  RETURN v_average_spending;
  EXCEPTION
	WHEN OTHERS THEN
	-- Handle any other exceptions
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- FUNCTION TO SUM RESTAURANT'S EARNINGS IN A GIVE PERIOD

CREATE OR REPLACE FUNCTION calculate_earnings (p_period IN VARCHAR)
  RETURN NUMBER
IS
  total_earned NUMBER := 0;
BEGIN
	-- Validate the period parameter
	IF p_period NOT IN ('week', 'month', 'year') THEN
	RAISE_APPLICATION_ERROR(-20003, 'Invalid period: ' || p_period);
	END IF;
	
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
  
  -- Validate if total_earned value is not null
	IF total_earned IS NULL THEN
	RAISE_APPLICATION_ERROR(-20004, 'No earnings found for the given period: ' || p_period);
	END IF;

  RETURN total_earned;
  EXCEPTION
	WHEN OTHERS THEN
	-- Handle any other exceptions
	RAISE; -- Reraise the exception for further handling at a higher level

END;