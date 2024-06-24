EXPLAIN SELECT * FROM User WHERE User_name = 2

CREATE INDEX idx_user_id ON User(user_id)


CREATE INDEX idx_user_id ON User(user_id,user_name)


CREATE EXTENSION pt_trgm;
---LIKE '%sdfsdf%'
CREATE INDEX trgm_ ON table USING gin(column trgm_ops)

