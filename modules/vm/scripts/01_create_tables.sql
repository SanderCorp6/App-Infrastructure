CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    picture VARCHAR(255)
);

CREATE TABLE Departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Employees (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL,
    address VARCHAR(255) NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    termination_date DATE NULL,
    contract_type VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(id) NULL,
    supervisor_id UUID REFERENCES employees(id) NULL,
    status VARCHAR(20) NOT NULL,
    reentry_date DATE NULL,
    created_by INT REFERENCES users(id) NULL,
    updated_by INT REFERENCES users(id) NULL
);


CREATE INDEX idx_employees_name ON employees (first_name, last_name);
CREATE INDEX idx_employees_status ON employees (status);
CREATE INDEX idx_employees_department ON employees (department_id);
CREATE INDEX idx_employees_id ON employees (id);