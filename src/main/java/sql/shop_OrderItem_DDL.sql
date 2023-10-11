-------------------------------------------------------------------------------- 
					-- CREATE TABLE --
--------------------------------------------------------------------------------
CREATE TABLE OrderItem (
    OrderItemID NUMBER PRIMARY KEY,
    OrderID NUMBER,
    ProductID NUMBER,
    Quantity NUMBER,
    Price NUMBER(10, 2)

);

/* ALTER TABLE OrderItem
ADD CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES Order(OrderID); */