DROP DATABASE IF EXISTS medical_database;

CREATE DATABASE medical_database;

DROP USER 'myuser'@'localhost';
DROP USER 'remuser'@'%';

CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypass';
CREATE USER 'remuser'@'%' IDENTIFIED BY 'rempass';

GRANT ALL ON *.* TO 'myuser'@'localhost';
GRANT ALL ON *.* TO 'remuser'@'%';
FLUSH PRIVILEGES;

USE medical_database;

CREATE TABLE patient_table (
    patient_fname CHAR(20) NOT NULL,
    patient_lname CHAR(20) NOT NULL,
    patient_address VARCHAR(80) NOT NULL,
    patient_phoneNum VARCHAR(15) NOT NULL,
    patient_email VARCHAR(40) NOT NULL,
    patient_DOB DATE NOT NULL,
    patient_gender CHAR(20) NOT NULL,
    patient_occupation CHAR(25) NOT NULL,
    patient_medHist VARCHAR(8000) NOT NULL,
    ec_name CHAR(20) NOT NULL,
    ec_phone VARCHAR(15) NOT NULL,
    ec_relation CHAR(15) NOT NULL,
    comment TEXT(8000) NOT NULL,
    discharge_comment TEXT(8000),
    patient_id INT(5) NOT NULL AUTO_INCREMENT,
    admit_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ready_discharge INT(1) NOT NULL DEFAULT 0,
    discharge_time TIMESTAMP,
    patient_illness CHAR(40),
    patient_medication CHAR(40),

    PRIMARY KEY (patient_id)
);

CREATE TABLE testing_table (
    patient_id INT(5) NOT NULL,
    test_type INT(1) NOT NULL DEFAULT 0,
    test_result TEXT(100) NOT NULL,

    FOREIGN KEY (patient_id) REFERENCES patient_table(patient_id) ON DELETE CASCADE
);

CREATE TABLE vitals_table (
    patient_id INT(5) NOT NULL,
    patient_height INT(3) NOT NULL,
    patient_weight INT(3) NOT NULL,
    patient_rate INT(3) NOT NULL,
    patient_pressure INT(3) NOT NULL,
    
    FOREIGN KEY (patient_id) REFERENCES patient_table(patient_id) ON DELETE CASCADE
);

CREATE TABLE employee_table (
    employee_id INT(5) NOT NULL,
    employee_pass VARCHAR(20) NOT NULL,
    employee_clearance INT(1) NOT NULL
);

ALTER TABLE patient_table AUTO_INCREMENT=1001;

INSERT INTO employee_table (employee_id, employee_pass, employee_clearance) VALUES (1,'defy',0);
INSERT INTO employee_table (employee_id, employee_pass, employee_clearance) VALUES (27,'help',1);
INSERT INTO employee_table (employee_id, employee_pass, employee_clearance) VALUES (30,'lend',2);

INSERT INTO patient_table (patient_fname, patient_lname, patient_address, patient_phoneNum, patient_email, patient_DOB,patient_gender, patient_occupation, patient_medHist, ec_name, ec_phone, ec_relation, comment) 
VALUES ('Abe','Lincoln','16 President Drive','123-456-7890','abel@whitehouse.gov','1832-04-12','M','Lawyer','concussion','Grant','908-774-1231','Friend','For tests');
