CREATE TABLE Employees (
  employee_id NUMBER(10) PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  role VARCHAR2(50),
  email VARCHAR2(100),
  phone VARCHAR2(20),
  salary NUMBER(10,2)
);

CREATE TABLE Orders (
  order_id NUMBER(10) PRIMARY KEY,
  employee_id NUMBER(10),
  customer_id NUMBER(10),
  order_date DATE,
  total_amount NUMBER(10,2),
  CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

CREATE TABLE Menu_Items (
  item_id NUMBER(10) PRIMARY KEY,
  item_name VARCHAR2(50),
  item_description VARCHAR2(100),
  price NUMBER(10,2)
);


CREATE TABLE Order_Items (
  order_item_id NUMBER(10) PRIMARY KEY,
  order_id NUMBER(10),
  item_id NUMBER(10),
  quantity NUMBER(10),
  CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);
