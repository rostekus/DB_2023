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
  DBMS_OUTPUT.PUT_LINE('Most ordered menu item: ' || most_ordered_item_name);
  DBMS_OUTPUT.PUT_LINE('Least ordered menu item: ' || least_ordered_item_name);
END;

-- PROCEDURE TO REPLACE A MENU ITEM WITH A NEW ONE

CREATE OR REPLACE PROCEDURE replace_menu_item(
  p_item_id IN menu_items.item_id%TYPE,
  p_new_item_name IN menu_items.item_name%TYPE,
  p_new_item_description IN menu_items.item_description%TYPE,
  p_new_price IN menu_items.price%TYPE
) IS
BEGIN
  UPDATE menu_items
  SET item_name = p_new_item_name,
      item_description = p_new_item_description,
      price = p_new_price
  WHERE item_id = p_item_id;
  
  DBMS_OUTPUT.PUT_LINE('The menu item ' || p_item_id || ' has been replaced');
END;