
-- mysqlds3_create_ind.sql: DVD Store Database Version 3 Create Indexes Script - MySQL version
-- <davejaffe7@gmail.com> and <tmuirhead@vmware.com>
-- Last updated 5/27/15


USE DS3;

CREATE UNIQUE INDEX IX_CUST_USERNAME ON CUSTOMERS 
  (
  USERNAME
  );

CREATE INDEX IX_CUST_HIST_CUSTOMERID ON CUST_HIST
  (
  CUSTOMERID
  );

ALTER TABLE CUST_HIST
  ADD CONSTRAINT FK_CUST_HIST_CUSTOMERID FOREIGN KEY (CUSTOMERID)
  REFERENCES CUSTOMERS (CUSTOMERID)
  ON DELETE CASCADE
  ;

CREATE INDEX IX_ORDER_CUSTID ON ORDERS
  (
  CUSTOMERID
  );

ALTER TABLE ORDERS 
  ADD CONSTRAINT FK_CUSTOMERID FOREIGN KEY (CUSTOMERID)
  REFERENCES CUSTOMERS (CUSTOMERID)
  ON DELETE SET NULL
  ;

CREATE UNIQUE INDEX IX_ORDERLINES_ORDERID ON ORDERLINES
  (
  ORDERID, ORDERLINEID
  );

ALTER TABLE ORDERLINES
  ADD CONSTRAINT FK_ORDERID FOREIGN KEY (ORDERID)
  REFERENCES ORDERS (ORDERID)
  ON DELETE CASCADE
  ;

CREATE FULLTEXT INDEX IX_PROD_ACTOR ON PRODUCTS 
  (
  ACTOR
  );

CREATE INDEX IX_PROD_CATEGORY ON PRODUCTS 
  (
  CATEGORY
  );

CREATE FULLTEXT INDEX IX_PROD_TITLE ON PRODUCTS 
  (
  TITLE
  );

CREATE INDEX IX_PROD_SPECIAL ON PRODUCTS 
  (
  SPECIAL
  );

ALTER TABLE MEMBERSHIP
  ADD CONSTRAINT FK_MEMBERSHIP_CUSTID FOREIGN KEY (CUSTOMERID)
  REFERENCES CUSTOMERS (CUSTOMERID)
  ON DELETE CASCADE
  ;

ALTER TABLE REVIEWS
  ADD CONSTRAINT FK_REVIEW_CUSTOMERID FOREIGN KEY (CUSTOMERID)
  REFERENCES CUSTOMERS (CUSTOMERID)
  ON DELETE CASCADE
  ;

CREATE INDEX IX_REVIEWS_PROD_ID ON REVIEWS
  (
  PROD_ID
  );

CREATE INDEX IX_REVIEWS_STARS on REVIEWS
  (
  STARS
  );

CREATE INDEX IX_REVIEWS_PRODSTARS on REVIEWS
  (
  PROD_ID,
  STARS
  );

ALTER TABLE REVIEWS_HELPFULNESS
  ADD CONSTRAINT FK_REVIEW_ID FOREIGN KEY (REVIEW_ID)
  REFERENCES REVIEWS (REVIEW_ID)
  ON DELETE CASCADE
  ;

CREATE INDEX IX_REVIEWS_HELP_REVID on REVIEWS_HELPFULNESS
  (
  REVIEW_ID
  );

CREATE INDEX IX_REVIEWS_HELP_CUSTID on REVIEWS_HELPFULNESS
  (
  CUSTOMERID
  );

CREATE INDEX IX_REORDER_PRODID on REORDER
  (
  PROD_ID
  );

CREATE INDEX IX_PROD_PRODID_COMMON ON PRODUCTS
  (
  PROD_ID ASC,
  COMMON_PROD_ID ASC
  );

CREATE INDEX IX_REVIEW_HELP_ID_HELPID ON REVIEWS_HELPFULNESS
  (
  REVIEW_ID ASC,
  REVIEWS_HELPFULNESS_ID ASC
  );

CREATE INDEX IX_REVIEWS_PRODID_REVID_DATE ON REVIEWS
  (
  PROD_ID ASC,
  REVIEW_ID ASC,
  REVIEW_DATE ASC
  );

CREATE INDEX IX_CUST_HIST_CUSTOMERID_PRODID ON CUST_HIST
   (
   CUSTOMERID ASC,
   PROD_ID ASC
   );

