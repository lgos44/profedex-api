USE profedex;
DROP PROCEDURE rate;
delimiter $$
CREATE PROCEDURE rate(uid INT, pid INT, rid INT, rval FLOAT)
begin
IF EXISTS(SELECT * FROM rating WHERE user_id = uid AND professor_id = pid AND rating_type_id = rid) THEN
	UPDATE rating SET rating_value = rval WHERE user_id = uid AND professor_id = pid AND rating_type_id = rid;
ELSE
	INSERT INTO rating (rating_value, professor_id, user_id, rating_type_id) VALUES (rval, pid, uid, rid);
END IF;
    end $$
delimiter ;
