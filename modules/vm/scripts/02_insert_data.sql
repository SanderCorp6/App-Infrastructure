INSERT INTO departments (name) VALUES
('Administration'), ('Finance'), ('Human Resources'), ('Legal'),
('Sales'), ('Marketing'), ('Customer Service'), ('Public Relations'), ('Operations'),
('Production'), ('Engineering'), ('Maintenance');

INSERT INTO users (name, role, email, password) VALUES
('Diego Gómez', 'Admin', 'diego@gmail.com', 'Password.'),
('Naomi Barrera', 'RRHH', 'naomi@gmail.com', 'Password.'),
('Máximo Camacho', 'RRHH', 'max@gmail.com', 'Password.'),
('Héctor Fuentes', 'Employee', 'hector@gmail.com', 'Password.'),
('Rogelio Santos', 'Employee', 'roger@gmail.com', 'Password.');

INSERT INTO employees
(first_name, last_name, email, phone_number, address, birth_date, hire_date, termination_date, contract_type, position, department_id, supervisor_id, status, reentry_date, created_by, updated_by)
VALUES
('Héctor', 'Fuentes', 'hector@gmail.com', '+52 477-3464-9834', 'Paseo de la Reforma 500', '2003-11-07', '2025-09-16', null, 'Temporal', 'QA', 1, null, 'Active', null, null, null),
('Samuel', 'Conde', 'samuel@gmail.com', '+52 477-123-3434', 'Calle Luna 8, Jardines', '2004-10-14', '2025-09-20', null, 'Permanent', 'Intern', 3, null, 'Active', null, null, null),
('Ana', 'González', 'ana.gonzalez@example.com', '+52 477-234-5678', 'Calle Falsa 123, Col. Centro', '1990-05-15', '2020-01-10', null, 'Permanent', 'Developer', 1, null, 'Active', null, null, null),
('Carlos', 'Martínez', 'carlos.martinez@example.com', '+52 477-345-6789', 'Avenida Siempre Viva 742', '1985-11-22', '2018-03-05', null, 'Permanent', 'Manager', 2, null, 'Active', null, null, null),
('María', 'Rodríguez', 'maria.rodriguez@example.com', '+52 477-456-7890', 'Boulevard de los Sueños 45', '1995-02-10', '2023-06-15', null, 'Temporary', 'Analyst', 3, null, 'Active', null, null, null),
('Luis', 'García', 'luis.garcia@example.com', '+52 477-567-8901', 'Calle Luna 8, Jardines', '1992-08-30', '2021-11-01', null, 'Contractor', 'Designer', 3, null, 'Active', null, null, null),
('Sofía', 'López', 'sofia.lopez@example.com', '+52 477-678-9012', 'Avenida Sol 100, Del Valle', '1988-07-19', '2015-09-20', null, 'Permanent', 'HR Specialist', 4, null, 'On Leave', null, null, null),
('Diego', 'Hernández', 'diego.hernandez@example.com', '+52 477-789-0123', 'Plaza Mayor 22', '1998-01-05', '2024-02-12', null, 'Temporary', 'Sales Rep', 5, null, 'Active', null, null, null),
('Laura', 'Sánchez', 'laura.sanchez@example.com', '+52 477-890-1234', 'Paseo de la Reforma 500', '1993-03-25', '2022-07-30', null, 'Permanent', 'Accountant', 2, null, 'Active', null, null, null),
('Miguel', 'Ramírez', 'miguel.ramirez@example.com', '+52 477-901-2345', 'Insurgentes Sur 1234', '1982-12-01', '2010-05-18', null, 'Permanent', 'Senior Developer', 1, null, 'Active', null, null, null);
