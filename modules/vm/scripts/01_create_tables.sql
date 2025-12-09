CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE positions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE employees (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    role VARCHAR(255) NOT NULL,
    password VARCHAR(255) NULL,
    is_first_login BOOLEAN DEFAULT TRUE,

    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL,
    address VARCHAR(255) NULL,
    birth_date DATE NOT NULL,
    image_url VARCHAR(255) NULL,

    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    termination_date DATE NULL,
    contract_type VARCHAR(100) NOT NULL,
    position_id INT REFERENCES positions(id) NULL,
    department_id INT REFERENCES departments(id) NULL,
    supervisor_id UUID REFERENCES employees(id) NULL,
    status VARCHAR(20) NOT NULL,
    reentry_date DATE NULL,

    salary NUMERIC(10, 2) DEFAULT 0,
    payroll_key VARCHAR(50),
    periodicity VARCHAR(20),
    cost_center VARCHAR(100),

    vacation_days_total INT DEFAULT 0,
    vacation_days_taken INT DEFAULT 0
);

CREATE TABLE employee_history (
    id SERIAL PRIMARY KEY,
    employee_id UUID REFERENCES employees(id) ON DELETE CASCADE,
    change_type VARCHAR(50) NOT NULL,
    description TEXT,
    previous_value TEXT,
    new_value TEXT,
    created_by UUID REFERENCES employees(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE vacation_requests (
    id SERIAL PRIMARY KEY,
    employee_id UUID REFERENCES employees(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    days_requested INT NOT NULL,
    type TEXT,
    description TEXT,
    status VARCHAR(20) DEFAULT 'Pending',
    reviewed_by UUID REFERENCES employees(id) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE openings (
    id SERIAL PRIMARY KEY,
    position_id INT REFERENCES positions(id) ON DELETE RESTRICT,
    department_id INT REFERENCES departments(id) ON DELETE RESTRICT,
    hiring_manager_id UUID REFERENCES employees(id),
    recruiter_id UUID REFERENCES employees(id),

    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    responsibilities TEXT[],
    requirements TEXT[],
    salary_min NUMERIC(10, 2) NOT NULL,
    salary_max NUMERIC(10, 2) NOT NULL,
    contract_type VARCHAR(50)
        CHECK (contract_type IN ('Full-time', 'Part-time', 'Intern', 'Permanent')),
    work_mode VARCHAR(20)
        CHECK (work_mode IN ('On-site', 'Hybrid', 'Remote')),

    location VARCHAR(255) NOT NULL,
    schedule VARCHAR(100) NOT NULL,

    opening_date DATE DEFAULT CURRENT_DATE,
    target_date DATE,
    closing_date DATE,
    closed_at TIMESTAMP,
    status VARCHAR(30) DEFAULT 'Open'
        CHECK (status IN ('Open', 'Paused', 'In interview', 'Offer extended', 'Closed')),

    is_filled BOOLEAN DEFAULT FALSE,
    closing_reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT NOW()
);

-- INDEX
-- Text search
CREATE INDEX idx_full_name_trgm ON employees USING gin (full_name gin_trgm_ops);
CREATE INDEX idx_employees_email_trgm ON employees USING gin (email gin_trgm_ops);
CREATE INDEX idx_employees_status_dept ON employees (status, department_id);
-- Filters
CREATE INDEX idx_employees_status ON employees (status);
CREATE INDEX idx_employees_department ON employees (department_id);
CREATE INDEX idx_employees_position ON employees (position_id);
CREATE INDEX idx_employees_supervisor ON employees (supervisor_id);
CREATE INDEX idx_employees_hire_date ON employees (hire_date);

CREATE INDEX idx_openings_status ON openings(status);
CREATE INDEX idx_openings_dept ON openings(department_id);
CREATE INDEX idx_openings_manager ON openings(hiring_manager_id);

-- Tables
CREATE INDEX idx_history_employee ON employee_history (employee_id);
CREATE INDEX idx_vacation_employee ON vacation_requests (employee_id);
CREATE INDEX idx_vacation_status ON vacation_requests (status);