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
    comment VARCHAR(8000) NOT NULL,
    patient_id INT(5) NOT NULL AUTO_INCREMENT,
    admit_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    discharge_time TIMESTAMP,
    patient_illness CHAR(40),
    patient_medication CHAR(40),

    PRIMARY KEY (patient_id)
);

CREATE TABLE testing_table (
    patient_id INT(5) NOT NULL,
    result CHAR(60) NOT NULL,
    order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (patient_id) REFERENCES patient_table(patient_id) ON DELETE CASCADE
);

CREATE TABLE employee_table (
    employee_id INT(5) NOT NULL,
    employee_pass VARCHAR(20) NOT NULL,
    employee_clearance INT(1) NOT NULL
);
