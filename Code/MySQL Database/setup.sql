DROP DATABASE IF EXISTS medical_database;

CREATE DATABASE medical_database;

DROP USER 'myuser'@'localhost' IDENTIFIED BY 'mypass';
DROP USER 'remuser'@'%' IDENTIFIED BY 'rempass';

CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypass';
CREATE USER 'remuser'@'%' IDENTIFIED BY 'rempass';

GRANT ALL ON *.* TO 'myuser'@'localhost';
GRANT ALL ON *.* TO 'remuser'@'%';
FLUSH PRIVILEGES;

USE medical_database;

CREATE TABLE admission_table (
    patient_id INT(5) NOT NULL AUTO_INCREMENT,
    admit_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    discharge_time TIMESTAMP NOT NULL,

    PRIMARY KEY (patient_id)
);
    

CREATE TABLE patient_table (
    patient_fname CHAR(20) NOT NULL,
    patient_lname CHAR(20) NOT NULL,
    patient_id INT(5) NOT NULL,

    FOREIGN KEY (patient_id) REFERENCES admission_table(patient_id) ON DELETE CASCADE
);

CREATE TABLE testing_table (
    patient_id INT(5) NOT NULL,
    result CHAR(60) NOT NULL,
    order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (patient_id) REFERENCES admission_table(patient_id) ON DELETE CASCADE
);
