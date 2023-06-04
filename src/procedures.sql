-- PROCEDURE TO DISPLAY LEAST AND MOST ORDERED MEAL

CREATE OR REPLACE PROCEDURE display_most_and_least_ordered_menu_items IS
  most_ordered_item_name VARCHAR2(50);
  least_ordered_item_name VARCHAR2(50);
BEGIN
  SELECT item_name
  INTO most_ordered_item_name
  FROM menu_items
  WHERE item_id = (
    SELECT item_id
    FROM order_items
    GROUP BY item_id
    ORDER BY SUM(quantity) DESC
    FETCH FIRST 1 ROWS ONLY
  );
  
   SELECT item_name
  INTO least_ordered_item_name
  FROM menu_items
  WHERE item_id = (
    SELECT item_id
    FROM order_items
    GROUP BY item_id
    ORDER BY SUM(quantity) ASC
    FETCH FIRST 1 ROWS ONLY
  );
	IF most_ordered_item_name IS NULL OR least_ordered_item_name IS NULL THEN
		RAISE_APPLICATION_ERROR(-20001, 'No menu items found.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Most ordered menu item: ' || most_ordered_item_name);
		DBMS_OUTPUT.PUT_LINE('Least ordered menu item: ' || least_ordered_item_name);
	END IF;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR(-20002, 'No menu items found.');
	WHEN OTHERS THEN
		RAISE; -- Reraise the exception for further handling at a higher level

END;

-- PROCEDURE TO REPLACE A MENU ITEM WITH A NEW ONE

CREATE OR REPLACE PROCEDURE replace_menu_item(
  p_item_id IN menu_items.item_id%TYPE,
  p_new_item_name IN menu_items.item_name%TYPE,
  p_new_item_description IN menu_items.item_description%TYPE,
  p_new_price IN menu_items.price%TYPE
) IS
BEGIN
	-- Validate the item_id parameter
	IF p_item_id IS NULL THEN
	RAISE_APPLICATION_ERROR(-20003, 'Item ID cannot be null.');
	END IF;

	SELECT COUNT(*)
	INTO item_exists
	FROM menu_items
	WHERE item_id = p_item_id;

	IF item_exists = 0 THEN
	RAISE_APPLICATION_ERROR(-20004, 'Menu item with ID ' || p_item_id || ' does not exist.');
	END IF;

-- Update the menu item
  UPDATE menu_items
  SET item_name = p_new_item_name,
      item_description = p_new_item_description,
      price = p_new_price
  WHERE item_id = p_item_id;
  
  DBMS_OUTPUT.PUT_LINE('The menu item ' || p_item_id || ' has been replaced');
  EXCEPTION
	WHEN NO_DATA_FOUND THEN
	RAISE_APPLICATION_ERROR(-20005, 'Menu item with ID ' || p_item_id || ' does not exist.');
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO ADD AN EMPLOYEE
CREATE OR REPLACE PROCEDURE add_employee(
p_employee_id IN Employees.employee_id%TYPE,
p_first_name IN Employees.first_name%TYPE,
p_last_name IN Employees.last_name%TYPE,
p_role IN Employees.role%TYPE,
p_email IN Employees.email%TYPE,
p_phone IN Employees.phone%TYPE,
p_salary IN Employees.salary%TYPE
) IS
BEGIN
	INSERT INTO Employees (employee_id, first_name, last_name, role, email, phone, salary)
	VALUES (p_employee_id, p_first_name, p_last_name, p_role, p_email, p_phone, p_salary);
	DBMS_OUTPUT.PUT_LINE('Employee added successfully.');
	
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	RAISE_APPLICATION_ERROR(-20001, 'Employee with ID ' || p_employee_id || ' already exists.');
	WHEN OTHERS THEN
RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO UPDATE AN EMPLOYEE
CREATE OR REPLACE PROCEDURE update_employee(
p_employee_id IN Employees.employee_id%TYPE,
p_first_name IN Employees.first_name%TYPE,
p_last_name IN Employees.last_name%TYPE,
p_role IN Employees.role%TYPE,
p_email IN Employees.email%TYPE,
p_phone IN Employees.phone%TYPE,
p_salary IN Employees.salary%TYPE
) IS
BEGIN
UPDATE Employees
SET first_name = p_first_name,
last_name = p_last_name,
	role = p_role,
	email = p_email,
	phone = p_phone,
	salary = p_salary
	WHERE employee_id = p_employee_id;

		IF SQL%ROWCOUNT = 0 THEN
			RAISE_APPLICATION_ERROR(-20002, 'Employee with ID ' || p_employee_id || ' does not exist.');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Employee updated successfully.');
		END IF;
	EXCEPTION
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO DELETE AN EMPLOYEE
CREATE OR REPLACE PROCEDURE delete_employee(
p_employee_id IN Employees.employee_id%TYPE
) IS
BEGIN
	DELETE FROM Employees
	WHERE employee_id = p_employee_id;

	IF SQL%ROWCOUNT = 0 THEN
		RAISE_APPLICATION_ERROR(-20003, 'Employee with ID ' || p_employee_id || ' does not exist.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Employee deleted successfully.');
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO ADD A MENU ITEM
CREATE OR REPLACE PROCEDURE add_menu_item(
p_item_id IN Menu_Items.item_id%TYPE,
p_item_name IN Menu_Items.item_name%TYPE,
p_item_description IN Menu_Items.item_description%TYPE,
p_price IN Menu_Items.price%TYPE
) IS
BEGIN
	INSERT INTO Menu_Items (item_id, item_name, item_description, price)
	VALUES (p_item_id, p_item_name, p_item_description, p_price);
	DBMS_OUTPUT.PUT_LINE('Menu item added successfully.');
	
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
		RAISE_APPLICATION_ERROR(-20004, 'Menu item with ID ' || p_item_id || ' already exists.');
	WHEN OTHERS THEN
RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO UPDATE A MENU ITEM
CREATE OR REPLACE PROCEDURE update_menu_item(
p_item_id IN Menu_Items.item_id%TYPE,
p_item_name IN Menu_Items.item_name%TYPE,
p_item_description IN Menu_Items.item_description%TYPE,
p_price IN Menu_Items.price%TYPE
) IS
BEGIN
	UPDATE Menu_Items
	SET item_name = p_item_name,
	item_description = p_item_description,
	price = p_price
	WHERE item_id = p_item_id;

	IF SQL%ROWCOUNT = 0 THEN
		RAISE_APPLICATION_ERROR(-20005, 'Menu item with ID ' || p_item_id || ' does not exist.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Menu item updated successfully.');
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO DELETE A MENU ITEM
CREATE OR REPLACE PROCEDURE delete_menu_item(
p_item_id IN Menu_Items.item_id%TYPE
) IS
BEGIN
	DELETE FROM Menu_Items
	WHERE item_id = p_item_id;

	IF SQL%ROWCOUNT = 0 THEN
		RAISE_APPLICATION_ERROR(-20006, 'Menu item with ID ' || p_item_id || ' does not exist.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Menu item deleted successfully.');
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO ADD AN ORDER
CREATE OR REPLACE PROCEDURE add_order(
p_order_id IN Orders.order_id%TYPE,
p_employee_id IN Orders.employee_id%TYPE,
p_customer_id IN Orders.customer_id%TYPE,
p_order_date IN Orders.order_date%TYPE,
p_total_amount IN Orders.total_amount%TYPE
) IS
BEGIN
	INSERT INTO Orders (order_id, employee_id, customer_id, order_date, total_amount)
	VALUES (p_order_id, p_employee_id, p_customer_id, p_order_date, p_total_amount);

	DBMS_OUTPUT.PUT_LINE('Order added successfully.');
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
		RAISE_APPLICATION_ERROR(-20007, 'Order with ID ' || p_order_id || ' already exists.');
	WHEN OTHERS THEN
		RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO UPDATE AN ORDER
CREATE OR REPLACE PROCEDURE update_order(
p_order_id IN Orders.order_id%TYPE,
p_employee_id IN Orders.employee_id%TYPE,
p_customer_id IN Orders.customer_id%TYPE,
p_order_date IN Orders.order_date%TYPE,
p_total_amount IN Orders.total_amount%TYPE
) IS
BEGIN
UPDATE Orders
	SET employee_id = p_employee_id,
	customer_id = p_customer_id,
	order_date = p_order_date,
	total_amount = p_total_amount
	WHERE order_id = p_order_id;

	IF SQL%ROWCOUNT = 0 THEN
		RAISE_APPLICATION_ERROR(-20008, 'Order with ID ' || p_order_id || ' does not exist.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Order updated successfully.');
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO DELETE AN ORDER
CREATE OR REPLACE PROCEDURE delete_order(
p_order_id IN Orders.order_id%TYPE
) IS
BEGIN
	DELETE FROM Orders
	WHERE order_id = p_order_id;

	IF SQL%ROWCOUNT = 0 THEN
		RAISE_APPLICATION_ERROR(-20009, 'Order with ID ' || p_order_id || ' does not exist.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Order deleted successfully.');
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO ADD AN ORDER ITEM
CREATE OR REPLACE PROCEDURE add_order_item(
p_order_item_id IN Order_Items.order_item_id%TYPE,
p_order_id IN Order_Items.order_id%TYPE,
p_item_id IN Order_Items.item_id%TYPE,
p_quantity IN Order_Items.quantity%TYPE
) IS
BEGIN
	INSERT INTO Order_Items (order_item_id, order_id, item_id, quantity)
	VALUES (p_order_item_id, p_order_id, p_item_id, p_quantity);
	DBMS_OUTPUT.PUT_LINE('Order item added successfully.');
	
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	RAISE_APPLICATION_ERROR(-20010, 'Order item with ID ' || p_order_item_id || ' already exists.');
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO UPDATE AN ORDER ITEM
CREATE OR REPLACE PROCEDURE update_order_item(
p_order_item_id IN Order_Items.order_item_id%TYPE,
p_order_id IN Order_Items.order_id%TYPE,
p_item_id IN Order_Items.item_id%TYPE,
p_quantity IN Order_Items.quantity%TYPE
) IS
BEGIN
	UPDATE Order_Items
	SET order_id = p_order_id,
	item_id = p_item_id,
	quantity = p_quantity
	WHERE order_item_id = p_order_item_id;

	IF SQL%ROWCOUNT = 0 THEN
		RAISE_APPLICATION_ERROR(-20011, 'Order item with ID ' || p_order_item_id || ' does not exist.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Order item updated successfully.');
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO DELETE AN ORDER ITEM
CREATE OR REPLACE PROCEDURE delete_order_item(
p_order_item_id IN Order_Items.order_item_id%TYPE
) IS
BEGIN
	DELETE FROM Order_Items
	WHERE order_item_id = p_order_item_id;

	IF SQL%ROWCOUNT = 0 THEN
		RAISE_APPLICATION_ERROR(-20012, 'Order item with ID ' || p_order_item_id || ' does not exist.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Order item deleted successfully.');
	END IF;
	EXCEPTION
	WHEN OTHERS THEN
	RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO ADD A CUSTOMER
CREATE OR REPLACE PROCEDURE add_customer(
  p_customer_id IN Customers.customer_id%TYPE,
  p_first_name IN Customers.first_name%TYPE,
  p_last_name IN Customers.last_name%TYPE,
  p_email IN Customers.email%TYPE,
  p_phone IN Customers.phone%TYPE
) IS
BEGIN
  INSERT INTO Customers (customer_id, first_name, last_name, email, phone)
  VALUES (p_customer_id, p_first_name, p_last_name, p_email, p_phone);
  
  DBMS_OUTPUT.PUT_LINE('Customer added successfully.');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    RAISE_APPLICATION_ERROR(-20013, 'Customer with ID ' || p_customer_id || ' already exists.');
  WHEN OTHERS THEN
    RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO UPDATE A CUSTOMER
CREATE OR REPLACE PROCEDURE update_customer(
  p_customer_id IN Customers.customer_id%TYPE,
  p_first_name IN Customers.first_name%TYPE,
  p_last_name IN Customers.last_name%TYPE,
  p_email IN Customers.email%TYPE,
  p_phone IN Customers.phone%TYPE
) IS
BEGIN
  UPDATE Customers
  SET first_name = p_first_name,
      last_name = p_last_name,
      email = p_email,
      phone = p_phone
  WHERE customer_id = p_customer_id;
  
  IF SQL%ROWCOUNT = 0 THEN
    RAISE_APPLICATION_ERROR(-20014, 'Customer with ID ' || p_customer_id || ' does not exist.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Customer updated successfully.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    RAISE; -- Reraise the exception for further handling at a higher level
END;

-- PROCEDURE TO DELETE A CUSTOMER
CREATE OR REPLACE PROCEDURE delete_customer(
  p_customer_id IN Customers.customer_id%TYPE
) IS
BEGIN
  DELETE FROM Customers
  WHERE customer_id = p_customer_id;
  
  IF SQL%ROWCOUNT = 0 THEN
    RAISE_APPLICATION_ERROR(-20015, 'Customer with ID ' || p_customer_id || ' does not exist.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Customer deleted successfully.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    RAISE; -- Reraise the exception for further handling at a higher level
END;