-------------------------------------------------------------------------------- 
					-- CREATE TABLE --
--------------------------------------------------------------------------------
CREATE TABLE ORDER (
    ORDERID NUMBER PRIMARY KEY,
    USERID NUMBER,
    ORDERDATE DATE,
    TOTALAMOUNT NUMBER(10, 2),
    ORDERSTATUSID NUMBER
);

/* ALTER TABLE Order
ADD FOREIGN KEY (UserID) REFERENCES User(UserID);

ALTER TABLE Order
ADD FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID);*/