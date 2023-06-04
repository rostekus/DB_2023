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

### `add_menu_item`

- **Description**: This procedure adds a new menu item to the Menu_Items table with the provided item details.
- **Input**:
  - `p_item_id`: The ID of the menu item (Menu_Items.item_id%TYPE).
  - `p_item_name`: The name of the menu item (Menu_Items.item_name%TYPE).
  - `p_item_description`: The description of the menu item (Menu_Items.item_description%TYPE).
  - `p_price`: The price of the menu item (Menu_Items.price%TYPE).
- **Output**: Confirmation message indicating successful addition of the menu item.
- **Exceptions**:
  - Raises an error if a menu item with the provided item ID already exists (DUP_VAL_ON_INDEX).
  - Raises any other unhandled exceptions.

### `update_menu_item`

- **Description**: This procedure updates the details of a menu item in the Menu_Items table based on the provided item ID.
- **Input**:
  - `p_item_id`: The ID of the menu item to be updated (Menu_Items.item_id%TYPE).
  - `p_item_name`: The updated name of the menu item (Menu_Items.item_name%TYPE).
  - `p_item_description`: The updated description of the menu item (Menu_Items.item_description%TYPE).
  - `p_price`: The updated price of the menu item (Menu_Items.price%TYPE).
- **Output**: Confirmation message indicating successful update of the menu item.
- **Exceptions**:
  - Raises an error if the menu item with the provided item ID does not exist.
  - Raises any other unhandled exceptions.

### `delete_menu_item`

- **Description**: This procedure deletes a menu item from the Menu_Items table based on the provided item ID.
- **Input**:
  - `p_item_id`: The ID of the menu item to be deleted (Menu_Items.item_id%TYPE).
- **Output**: Confirmation message indicating successful deletion of the menu item.
- **Exceptions**:
  - Raises an error if the menu item with the provided item ID does not exist.
  - Raises any other unhandled exceptions.

### `add_order`

- **Description**: This procedure adds a new order to the Orders table with the provided order details.
- **Input**:
  - `p_order_id`: The ID of the order (Orders.order_id%TYPE).
  - `p_employee_id`: The ID of the employee associated with the order (Orders.employee_id%TYPE).
  - `p_customer_id`: The ID of the customer who placed the order (Orders.customer_id%TYPE).
  - `p_order_date`: The date of the order (Orders.order_date%TYPE).
  - `p_total_amount`: The total amount of the order (Orders.total_amount%TYPE).
- **Output**: Confirmation message indicating successful addition of the order.
- **Exceptions**:
  - Raises an error if an order with the provided order ID already exists (DUP_VAL_ON_INDEX).
  - Raises any other unhandled exceptions.

### `update_order`

- **Description**: This procedure updates the details of an order in the Orders table based on the provided order ID.
- **Input**:
  - `p_order_id`: The ID of the order to be updated (Orders.order_id%TYPE).
  - `p_employee_id`: The updated ID of the employee associated with the order (Orders.employee_id%TYPE).
  - `p_customer_id`: The updated ID of the customer who placed the order (Orders.customer_id%TYPE).
  - `p_order_date`: The updated date of the order (Orders.order_date%TYPE).
  - `p_total_amount`: The updated total amount of the order (Orders.total_amount%TYPE).
- **Output**: Confirmation message indicating successful update of the order.
- **Exceptions**:
  - Raises an error if the order with the provided order ID does not exist.
  - Raises any other unhandled exceptions.

### `delete_order`

- **Description**: This procedure deletes an order from the Orders table based on the provided order ID.
- **Input**:
  - `p_order_id`: The ID of the order to be deleted (Orders.order_id%TYPE).
- **Output**: Confirmation message indicating successful deletion of the order.
- **Exceptions**:
  - Raises an error if the order with the provided order ID does not exist.
  - Raises any other unhandled exceptions.

### `add_order_item`

- **Description**: This procedure adds a new order item to the Order_Items table with the provided item details.
- **Input**:
  - `p_order_item_id`: The ID of the order item (Order_Items.order_item_id%TYPE).
  - `p_order_id`: The ID of the order to which the item belongs (Order_Items.order_id%TYPE).
  - `p_item_id`: The ID of the item being ordered (Order_Items.item_id%TYPE).
  - `p_quantity`: The quantity of the item being ordered (Order_Items.quantity%TYPE).
- **Output**: Confirmation message indicating successful addition of the order item.
- **Exceptions**:
  - Raises an error if an order item with the provided item ID already exists (DUP_VAL_ON_INDEX).
  - Raises any other unhandled exceptions.

### `update_order_item`

- **Description**: This procedure updates the details of an order item in the Order_Items table based on the provided order item ID.
- **Input**:
  - `p_order_item_id`: The ID of the order item to be updated (Order_Items.order_item_id%TYPE).
  - `p_order_id`: The updated ID of the order to which the item belongs (Order_Items.order_id%TYPE).
  - `p_item_id`: The updated ID of the item being ordered (Order_Items.item_id%TYPE).
  - `p_quantity`: The updated quantity of the item

### `delete_order_item`

- **Description**: This procedure deletes an order item from the Order_Items table based on the provided order item ID.
- **Input**:
  - `p_order_item_id`: The ID of the order item to be deleted (Order_Items.order_item_id%TYPE).
- **Output**: Confirmation message indicating successful deletion of the order item.
- **Exceptions**:
  - Raises an error if the order item with the provided order item ID does not exist.
  - Raises any other unhandled exceptions.
 
### `add_customer`

- **Description**: This procedure adds a new customer to the Customers table.
- **Input**:
  - `p_customer_id` (Customers.customer_id%TYPE): The customer ID of the new customer.
  - `p_first_name` (Customers.first_name%TYPE): The first name of the new customer.
  - `p_last_name` (Customers.last_name%TYPE): The last name of the new customer.
  - `p_email` (Customers.email%TYPE): The email address of the new customer.
  - `p_phone` (Customers.phone%TYPE): The phone number of the new customer.
- **Output**: Confirmation message indicating successful addition.
- **Exceptions**:
  - Raises an error with error code -20013 and a custom error message if a customer with the same ID already exists.
  - Reraises any other exceptions for further handling at a higher level.

### `update_customer`

- **Description**: This procedure updates an existing customer in the Customers table.
- **Input**:
  - `p_customer_id` (Customers.customer_id%TYPE): The customer ID of the customer to be updated.
  - `p_first_name` (Customers.first_name%TYPE): The updated first name of the customer.
  - `p_last_name` (Customers.last_name%TYPE): The updated last name of the customer.
  - `p_email` (Customers.email%TYPE): The updated email address of the customer.
  - `p_phone` (Customers.phone%TYPE): The updated phone number of the customer.
- **Output**: Confirmation message indicating successful update.
- **Exceptions**:
  - Raises an error with error code -20014 and a custom error message if the customer with the specified ID does not exist.
  - Reraises any other exceptions for further handling at a higher level.

### `delete_customer`

- **Description**: This procedure deletes an existing customer from the Customers table.
- **Input**:
  - `p_customer_id` (Customers.customer_id%TYPE): The customer ID of the customer to be deleted.
- **Output**: Confirmation message indicating successful deletion.
- **Exceptions**:
  - Raises an error with error code -20015 and a custom error message if the customer with the specified ID does not exist.
  - Reraises any other exceptions for further handling at a higher level.


## Functions

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
