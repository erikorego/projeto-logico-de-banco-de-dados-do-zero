USE repair_shop;

-- Lista de Clientes Pessoa física:
SELECT 
    CONCAT(first_name, ' ', surname) AS 'Nome do cliente'
FROM
    clients
WHERE
    NOT (cpf = 'NULL')
ORDER BY first_name;

-- Lista de Clientes Pessoa Jurídica:
SELECT 
    corporate_name AS 'Nome do cliente'
FROM
    clients
WHERE
    cnpj <> 'NULL'
ORDER BY corporate_name;

-- Lista de Funcionários e Cargos:
SELECT 
    CONCAT(first_name, ' ', surname) AS Funcionário,
    position AS Cargo
FROM
    employee
ORDER BY Cargo , Funcionário;

-- Mecãnicos Ordenados por Ordem de Serviços Executadas:
SELECT 
    CONCAT(first_name, ' ', surname) AS Mecânico,
    COUNT(idOS_employee) AS Quantidade
FROM
    os
        INNER JOIN
    employee ON (idOS_employee = idEmployee)
GROUP BY Mecânico
ORDER BY Quantidade DESC;

-- Serviço mais utilizado:
SELECT 
    service_type AS Serviço, COUNT(service_type) AS QTD
FROM
    os
GROUP BY Serviço
ORDER BY QTD DESC;

-- Clientes PF mais asssíduos de 2023:
SELECT 
    CONCAT(first_name, ' ', surname) AS Cliente,
    COUNT(os_date > '2022-12-31') AS Visitas
FROM
    clients
        INNER JOIN
    os ON idClient = idOS_client
GROUP BY Cliente
HAVING Cliente <> 'NULL'
ORDER BY Visitas DESC;