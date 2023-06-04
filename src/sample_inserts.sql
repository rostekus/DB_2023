
-- SAMPLE DATA

-- Insert sample data into the Customers table
INSERT INTO Customers (customer_id, first_name, last_name, email, phone)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '555-1234');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone)
VALUES (2, 'Jane', 'Doe', 'janedoe@example.com', '555-5678');

-- Insert sample data into the Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES (1, 2, '2022-05-09', 25.50);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES (2, 1, '2022-05-08', 35.75);

-- Insert sample data into the Menu Items table
INSERT INTO Menu_Items (item_id, item_name, item_description, price)
VALUES (1, 'Hamburger', 'Juicy beef patty on a fresh bun', 10.99);

INSERT INTO Menu_Items (item_id, item_name, item_description, price)
VALUES (2, 'Cheeseburger', 'Same as hamburger, with melted cheese', 12.99);

-- Insert sample data into the Order Items table
INSERT INTO Order_Items (order_item_id, order_id, item_id, quantity)
VALUES (1, 1, 1, 2);

INSERT INTO Order_Items (order_item_id, order_id, item_id, quantity)
VALUES (2, 1, 2, 1);

INSERT INTO Order_Items (order_item_id, order_id, item_id, quantity)
VALUES (3, 2, 1, 3);

INSERT INTO Employees (employee_id, first_name, last_name, role, email, phone, salary)
VALUES (1, 'Alice', 'Smith', 'Manager', 'asmith@example.com', '555-2468', 7000);

INSERT INTO Employees (employee_id, first_name, last_name, role, email, phone, salary)
VALUES (2, 'Bob', 'Jones', 'Cook', 'bjones@example.com', '555-1357', 6000);