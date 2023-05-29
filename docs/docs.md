# Documentation: Restaurant Management System

This is a documentation for a Restaurant Management System that includes tables, procedures, and functions to manage customer information, employee details, orders, and menu items. The system allows for data manipulation, calculation of revenue, employee salaries, customer spendings, and displaying frequently and least ordered menu items. Below is the description of each component of the system:

## Tables

### Customers

- **customer_id**: Unique identifier for each customer.
- **first_name**: First name of the customer.
- **last_name**: Last name of the customer.
- **email**: Email address of the customer.
- **phone**: Phone number of the customer.

### Employees

- **employee_id**: Unique identifier for each employee.
- **first_name**: First name of the employee.
- **last_name**: Last name of the employee.
- **role**: Role or position of the employee.
- **email**: Email address of the employee.
- **phone**: Phone number of the employee.
- **salary**: Yearly salary of the employee.

### Orders

- **order_id**: Unique identifier for each order.
- **employee_id**: Identifier for the employee associated with the order.
- **customer_id**: Identifier for the customer who placed the order.
- **order_date**: Date of the order.
- **total_amount**: Total amount or price of the order.

### Menu_Items

- **item_id**: Unique identifier for each menu item.
- **item_name**: Name of the menu item.
- **item_description**: Description or details of the menu item.
- **price**: Price of the menu item.

### Order_Items

- **order_item_id**: Unique identifier for each order item.
- **order_id**: Identifier for the order associated with the item.
- **item_id**: Identifier for the menu item included in the order.
- **quantity**: Quantity or number of items ordered.

## Procedures

### `display_most_and_least_ordered_menu_items`

- **Description**: This procedure retrieves and displays the most and least ordered menu items based on the quantity of items ordered.
- **Output**: The most ordered menu item and the least ordered menu item.
- **Exceptions**: Raises an error if no menu items are found.

### `replace_menu_item`

- **Description**: This procedure replaces an existing menu item with a new one based on the provided item ID.
- **Input**: Item ID of the menu item to be replaced, along with the details of the new item (name, description, and price).
- **Output**: Confirmation message indicating successful replacement.
- **Exceptions**: Raises an error if the item ID is not provided or if the menu item with the given ID does not exist.

### `add_employee`

- **Description**: This procedure adds a new employee to the Employees table.
- **Input**: Employee details including ID, first name, last name, role, email, phone, and salary.
- **Output**: Confirmation message indicating successful addition.
- **Exceptions**: Raises an error if an employee with the same ID already exists.

### `update_employee`

- **Description**: This procedure updates the details of an existing employee based on the provided employee ID.
- **Input**: Employee ID along with the updated employee details (first name, last name, role, email, phone, and salary).
- **Output**: Confirmation message indicating successful update.
- **Exceptions**: Raises an error if the employee with the given ID does not exist.

### `delete_employee`

- **Description**: This procedure deletes an employee from the Employees table based on the provided employee ID.
- **Input**: Employee ID.
- **Output**: Confirmation message indicating successful deletion.
- **Exceptions**: Raises an error if the employee with the

### `calculate_yearly_salary`

- **Description**: This function calculates the yearly salary for an employee based on their monthly salary.
- **Parameters**:
  - `p_employee_id` (IN): The ID of the employee for whom the yearly salary is to be calculated.
- **Returns**:
  - The calculated yearly salary as a number.
- **Exceptions**:
  - Raises an error with code -20001 if the `p_employee_id` parameter is NULL.
  - Raises an error with code -20002 if an employee with the given `p_employee_id` does not exist.

### `calculate_total_spendings`

- **Description**: This function calculates the total spendings made by a customer based on their orders.
- **Parameters**:
  - `p_customer_id` (IN): The ID of the customer for whom the total spendings are to be calculated.
- **Returns**:
  - The total spendings as a number.
- **Exceptions**:
  - Raises an error with code -20001 if the `p_customer_id` parameter is NULL.
  - Raises an error with code -20002 if a customer with the given `p_customer_id` does not exist.

### `calculate_average_spending`

- **Description**: This function calculates the average spending per order made by a customer.
- **Parameters**:
  - `p_customer_id` (IN): The ID of the customer for whom the average spending is to be calculated.
- **Returns**:
  - The average spending per order as a number.
- **Exceptions**:
  - Raises an error with code -20001 if the `p_customer_id` parameter is NULL.
  - Raises an error with code -20002 if a customer with the given `p_customer_id` does not exist.

### `calculate_earnings`

- **Description**: This function calculates the total earnings of a restaurant for a given period (week, month, or year) based on the orders placed.
- **Parameters**:
  - `p_period` (IN): The period for which the earnings are to be calculated (week, month, or year).
- **Returns**:
  - The total earnings as a number.
- **Exceptions**:
  - Raises an error with code -20003 if an invalid period is provided.
  - Raises an error with code -20004 if no earnings are found for the given period.
