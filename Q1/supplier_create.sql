CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID INT AUTO_INCREMENT,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY VARCHAR(50),
SUPP_PHONE VARCHAR(10) NOT NULL,
PRIMARY KEY (SUPP_ID)
);