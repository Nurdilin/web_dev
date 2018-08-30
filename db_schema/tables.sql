create table if not exists t_user (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	user_username VARCHAR(45) NULL,
	user_password VARCHAR(45) NULL,
	user_name VARCHAR(45) NULL,
	user_lastname VARCHAR(45) NULL
);

