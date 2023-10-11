-------------------------------------------------------------------------------- 
					-- CREATE TABLE --
--------------------------------------------------------------------------------
CREATE TABLE Cart (
    CartID NUMBER PRIMARY KEY,
    UserID NUMBER,
    ProductID NUMBER,
    Quantity NUMBER
);
/* ALTER TABLE Cart
ADD FOREIGN KEY (UserID) REFERENCES User(UserID);

ALTER TABLE Cart
ADD FOREIGN KEY (ProductID) REFERENCES Product(ProductID);*/