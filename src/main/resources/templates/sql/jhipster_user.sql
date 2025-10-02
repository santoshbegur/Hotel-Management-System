SELECT `databasechangelog`.`ID`,
    `databasechangelog`.`AUTHOR`,
    `databasechangelog`.`FILENAME`,
    `databasechangelog`.`DATEEXECUTED`,
    `databasechangelog`.`ORDEREXECUTED`,
    `databasechangelog`.`EXECTYPE`,
    `databasechangelog`.`MD5SUM`,
    `databasechangelog`.`DESCRIPTION`,
    `databasechangelog`.`COMMENTS`,
    `databasechangelog`.`TAG`,
    `databasechangelog`.`LIQUIBASE`,
    `databasechangelog`.`CONTEXTS`,
    `databasechangelog`.`LABELS`,
    `databasechangelog`.`DEPLOYMENT_ID`
FROM `hotelmanagementsystem`.`databasechangelog`;

SELECT `databasechangeloglock`.`ID`,
    `databasechangeloglock`.`LOCKED`,
    `databasechangeloglock`.`LOCKGRANTED`,
    `databasechangeloglock`.`LOCKEDBY`
FROM `hotelmanagementsystem`.`databasechangeloglock`;

SELECT `jhi_authority`.`name`
FROM `hotelmanagementsystem`.`jhi_authority`;

SELECT `jhi_persistent_token`.`series`,
    `jhi_persistent_token`.`user_id`,
    `jhi_persistent_token`.`token_value`,
    `jhi_persistent_token`.`token_date`,
    `jhi_persistent_token`.`ip_address`,
    `jhi_persistent_token`.`user_agent`
FROM `hotelmanagementsystem`.`jhi_persistent_token`;

SELECT `jhi_user`.`id`,
    `jhi_user`.`login`,
    `jhi_user`.`password_hash`,
    `jhi_user`.`first_name`,
    `jhi_user`.`last_name`,
    `jhi_user`.`email`,
    `jhi_user`.`image_url`,
    `jhi_user`.`activated`,
    `jhi_user`.`lang_key`,
    `jhi_user`.`activation_key`,
    `jhi_user`.`reset_key`,
    `jhi_user`.`created_by`,
    `jhi_user`.`created_date`,
    `jhi_user`.`reset_date`,
    `jhi_user`.`last_modified_by`,
    `jhi_user`.`last_modified_date`
FROM `hotelmanagementsystem`.`jhi_user`;

SELECT `jhi_user_authority`.`user_id`,
    `jhi_user_authority`.`authority_name`
FROM `hotelmanagementsystem`.`jhi_user_authority`;
