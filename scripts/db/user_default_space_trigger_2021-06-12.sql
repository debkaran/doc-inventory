DELIMITER $$

CREATE TRIGGER after_default_user_space_update
AFTER UPDATE
ON default_user_space FOR EACH ROW
BEGIN
	DECLARE balance_space float;
    set balance_space = new.storage_space - old.storage_space;
    SET SQL_SAFE_UPDATES = 0;
    INSERT INTO default_user_space_log(old_storage_space, new_storage_space)
        VALUES(old.storage_space, new.storage_space);
    update user_details set storage_space = storage_space + balance_space 
		where role = 'user';
	SET SQL_SAFE_UPDATES = 1;
END$$

DELIMITER ;