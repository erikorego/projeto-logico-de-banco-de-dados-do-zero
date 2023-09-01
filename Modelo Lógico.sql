CREATE DATABASE repair_shop;
USE repair_shop;


-- FUNCIONARIOS
CREATE TABLE employee (
    idEmployee INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    surname VARCHAR(25) NOT NULL,
    CPF CHAR(11) NOT NULL,
    position ENUM('Gerente', 'Mecânico', 'Serviços Gerais', 'Atendimento ao Cliente'),
    CONSTRAINT unique_cpf_employee UNIQUE (CPF)
);
ALTER TABLE employee AUTO_INCREMENT = 1;

-- CLIENTES
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    surname VARCHAR(25),
    corporate_name VARCHAR(30),
    cnpj CHAR(15),
    cpf CHAR(11),
    vehicle_type ENUM('Carro', 'Moto', 'Caminhão', 'Ônibus') NOT NULL,
    vehicle_brand VARCHAR(10),
    vehicle_model VARCHAR(15),
    vehicle_description VARCHAR(45),
    CONSTRAINT unique_cpf_clients UNIQUE (cpf),
    CONSTRAINT unique_cnpj_clients UNIQUE (cnpj),
    CONSTRAINT unique_category_of_client CHECK (cpf IS NULL XOR cnpj IS NULL)
);
ALTER TABLE clients AUTO_INCREMENT = 1;

-- PEÇAS
CREATE TABLE part (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    part_name VARCHAR(20) NOT NULL,
    part_vehicle_type ENUM('Carro', 'Moto', 'Caminhão', 'Ônibus') NOT NULL,
    part_vehicle_brand VARCHAR(10),
    part_vehicle_model VARCHAR(15),
    quantity_in_stock INT
);
ALTER TABLE part AUTO_INCREMENT = 1;

-- ORDEM DE SERVIÇO
CREATE TABLE os (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    idOS_client INT,
    idOS_employee INT,
    service_type ENUM('Manutenção', 'Revisão', 'Troca de peça', 'Limpeza'),
    os_description VARCHAR(45),
    service_price FLOAT,
    os_date DATE,
    CONSTRAINT fk_id_os_client FOREIGN KEY (idOS_client)
        REFERENCES clients (idClient),
    CONSTRAINT fk_id_os_employee FOREIGN KEY (idOS_employee)
        REFERENCES employee (idEmployee)
);
ALTER TABLE os AUTO_INCREMENT = 1;

-- PEÇAS POR ORDEM DE SERVIÇO
CREATE TABLE part_per_os (
    idPO_os INT,
    idPO_part INT,
    part_quantity INT,
    CONSTRAINT fk_idPO_os FOREIGN KEY (idPO_os)
        REFERENCES os (idOS),
    CONSTRAINT fk_idPO_part FOREIGN KEY (idPO_part)
        REFERENCES part (idPart)
);