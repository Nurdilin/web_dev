DELIMITER //

CREATE PROCEDURE `p_createUser`(
	IN p_username VARCHAR(45),
	IN p_password VARCHAR(45),
	IN p_name VARCHAR(45),
	IN p_lastname VARCHAR(45)
)
BEGIN
IF ( select exists (select 1 from t_user where user_username = p_username) ) THEN
	select 'Username Exists !';     
ELSE
	insert into t_user
	(
	    user_username,
	    user_password,
	    user_name,
	    user_lastname
	)
	values
	(
	p_username,
	p_password,
	p_name,
	p_lastname
	);    
END IF;
END; //
DELIMITER ;
