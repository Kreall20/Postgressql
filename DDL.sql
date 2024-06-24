CREATE TABLE TestTablealways
(
	testid int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	testName text NOT NULL
);

ALTER TABLE TestTable
RENAME TO Testtab;


ALTER TABLE Testtab
ADD COLUMN TestDate date NOT NULL;

ALTER TABLE Testtab
DROP COLUMN testdate;


ALTER TABLE Testtab
RENAME testdate TO testnewdate;

ALTER TABLE Testtab
ALTER COLUMN testnewdate SET DATA TYPE text



TRUNCATE TABLE nameoftable RESTART IDENTITY;


ALTER TABLE nameoftable
DROP CONSTRAINT 
ADD PRIMARY KEY(columnname)

ALTER TABLE nameoftable
ADD CONSTRAINT consname FOREIGN KEY(columnname) REFERENCES foreigntablename(columnname)


CONSTRAINT consname FOREIGN KEY(columnname)


ALTER TABLE testtab
ADD COLUMN price decimal CONSTRAINT chk_test_price CHECK(price >= 0)

INSERT INTO testtab
VALUES 
(3,'title',-12,-100)


CREATE TABLE (

	name text DEFAULT,
	sum int CHECK (sum > 100)

)
CREATE SEQUENCE seq1
INCREMENT
MINVALUE
MAXVALUE
START WITH

ALTER SEQUENCE
SELECT nextval('seq1')

SELECT setval('seq1',15)


CREATE SEQUENCE book_bookid
START WITH 1 OWNED BY book.book_id;


ALTER TABLE
ALTER COLUMN bookid SET DEFAULT nextval(book_bookid)

