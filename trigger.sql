SHOW VARIABLES LIKE 'log_bin_trust_function_creators';

SET GLOBAL log_bin_trust_function_creators=1;

SHOW VARIABLES LIKE 'log_bin_trust_function_creators';

GRANT TRIGGER ON `masterdata`.* TO `masterdata`@`%` WITH GRANT OPTION;

CREATE TRIGGER auto_grant_view AFTER INSERT ON auth_user FOR EACH ROW
INSERT INTO auth_user_groups (user_id, group_id) VALUES (NEW.id, 1);
