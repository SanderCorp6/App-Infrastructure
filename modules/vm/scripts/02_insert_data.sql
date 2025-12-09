-- INSERTS
INSERT INTO departments (name) VALUES
('Administration'), ('Finance'), ('Human Resources'), ('Legal'),
('Sales'), ('Marketing'), ('Customer Service'), ('Public Relations'), ('Operations'),
('Production'), ('Engineering'), ('Maintenance'), ('Design');

INSERT INTO positions (name) VALUES
('CEO'), ('COO'), ('CTO'), ('CFO'), ('HR Manager'), ('Project Manager'),
('Product Manager'), ('Software Developer'), ('Frontend Developer'), ('Backend Developer'), ('Full Stack Developer'),
('QA Engineer'), ('DevOps Engineer'), ('UI/UX Designer'), ('Data Analyst'), ('Data Scientist'),
('IT Support'), ('Marketing Manager'), ('Sales Representative'), ('Customer Service');

INSERT INTO employees
(id, role, password, is_first_login, image_url, first_name, last_name, email, phone_number, address, birth_date, hire_date, termination_date, contract_type, position_id, department_id, supervisor_id, status, salary, payroll_key, periodicity, cost_center, vacation_days_total)
VALUES
('16f9862c-0cf6-4a4e-8ac8-2b21435cf65f', 'Administrator', '$2b$10$GAGmUzKZzZbTIxdwUQGh6eVAGPR9oVYrCPNhOPcyxZ8C0leWcxsr.', false, 'https://rrhh-profile-images.s3.us-west-1.amazonaws.com/7b4cb409a190a11470d24b73749ab124eb8c1d2aab4cd46f30509fd5c4d9dcc6','Samuel', 'Conde', 'samuel@gmail.com', '+52 477-403-2170', 'Alamedas de Alcázar 242', '2004-10-14', '2025-09-01', null, 'Permanent', 1, 1, null, 'Active', 25000, 'ADM-0234', 'Bi-weekly', 'CC-ADM', '20');

INSERT INTO employees
(id, role, first_name, last_name, email, phone_number, address, birth_date, hire_date, termination_date, contract_type, position_id, department_id, supervisor_id, status, salary, payroll_key, periodicity, cost_center, vacation_days_total)
VALUES
('59713ebf-39e7-4796-8ab8-f8202e1728c5', 'Employee', 'Diego', 'Gómez', 'diego@gmail.com', '+52 477-345-3535', 'Gran Jardín', '2003-05-07', '2025-10-01', null, 'Full-time', 8, 11, '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f', 'Active', 30500, 'ENG-0764', 'Bi-weekly', 'CC-ADM', '20'),
('a902b860-7a2e-4318-9309-8695ba2bfb22', 'Employee', 'Naomi', 'Barrera', 'naomi@gmail.com', '+52 477-654-7653', 'Random place', '2004-01-28', '2025-10-08', null, 'Part-time', 14, 13, '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f', 'Inactive', 27000, 'DES-0546', 'Weekly', 'CC-DES', '12'),
('7e237d8c-e3b3-4519-a5a9-784345fd7b1d', 'HR', 'Máximo', 'Camacho', 'max@gmail.com', '+52 477-901-0245', 'Random place', '2004-03-23', '2025-11-22', null, 'Full-time', 5, 3, '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f', 'Active', 32000, 'HUM-0764', 'Bi-weekly', 'CC-PROD', '15');

INSERT INTO employees
(role, first_name, last_name, email, phone_number, address, birth_date, hire_date, termination_date, contract_type, position_id, department_id, supervisor_id, status, salary, payroll_key, periodicity, cost_center, vacation_days_total)
VALUES
('Employee', 'Héctor', 'Fuentes', 'hector@gmail.com', '+52 477-746-0917', 'Random place', '2003-11-07', '2025-11-27', null, 'Intern', 10, 11, '59713ebf-39e7-4796-8ab8-f8202e1728c5', 'Active', 30000, 'ENG-0348', 'Bi-weekly', 'CC-PROD', '18'),
('Employee', 'Rogelio', 'Santos', 'roger@gmail.com', '+52 477-384-9942', 'Random place', '1993-01-09', '2025-10-18', null, 'Part-time', 19, 2, '7e237d8c-e3b3-4519-a5a9-784345fd7b1d', 'Inactive', 27500, 'ENG-0546', 'Weekly', 'CC-PROD', '12');

INSERT INTO openings
(position_id, department_id, hiring_manager_id, recruiter_id,
 title, description, responsibilities, requirements,
 salary_min, salary_max, contract_type, work_mode,
 location, schedule,
 opening_date, target_date, closing_date, closed_at,
 status, is_filled, closing_reason)
VALUES
(8, 11,
 '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f',
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 'Software Developer',
 'Backend developer for internal systems.',
 ARRAY['Develop APIs','Fix bugs','Write tests'],
 ARRAY['Node.js','PostgreSQL','REST APIs'],
 25000, 35000, 'Permanent', 'Hybrid',
 'León, Guanajuato, MX', 'Mon–Fri 9:00–18:00',
 '2025-01-10', '2025-02-15', NULL, NULL,
 'Open', FALSE, NULL),

(9, 11,
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 '7e237d8c-e3b3-4519-a5a9-784345fd7b1d',
 'Frontend Developer',
 'Responsible for building UI using modern frameworks.',
 ARRAY['Build UI components','Optimize performance','Collaborate with designers'],
 ARRAY['React','HTML','CSS','JavaScript'],
 22000, 32000, 'Full-time', 'Remote',
 'Ciudad de México, MX', 'Mon–Fri 9:00–18:00',
 '2025-01-05', '2025-02-10', NULL, NULL,
 'In interview', FALSE, NULL),

(10, 11,
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f',
 'Backend Developer',
 'API and microservices development.',
 ARRAY['Develop services','Database optimization','Code reviews'],
 ARRAY['Java','Spring Boot','Microservices'],
 28000, 40000, 'Full-time', 'On-site',
 'León, Guanajuato, MX', 'Mon–Fri 9:00–18:00',
 '2025-01-03', '2025-02-20', NULL, NULL,
 'Offer extended', FALSE, NULL),

(5, 3,
 '7e237d8c-e3b3-4519-a5a9-784345fd7b1d',
 '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f',
 'HR Assistant',
 'Support recruitment and onboarding activities.',
 ARRAY['Post job ads','Screen CVs','Schedule interviews'],
 ARRAY['Recruitment','Interviewing','ATS systems'],
 18000, 24000, 'Part-time', 'On-site',
 'Monterrey, NL, MX', 'Mon–Fri 8:00–14:00',
 '2025-01-08', '2025-02-05', NULL, NULL,
 'Paused', FALSE, NULL),

(19, 5,
 '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f',
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 'Sales Representative',
 'Drive customer acquisition and maintain relationships.',
 ARRAY['Prospect clients','Close deals','CRM updates'],
 ARRAY['Sales techniques','Negotiation','CRM tools'],
 20000, 30000, 'Full-time', 'Hybrid',
 'Guadalajara, JAL, MX', 'Mon–Fri 9:00–17:00',
 '2025-01-01', '2025-01-30', NULL, NULL,
 'Open', FALSE, NULL),

(14, 13,
 '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f',
 '7e237d8c-e3b3-4519-a5a9-784345fd7b1d',
 'UI/UX Designer',
 'Improve user experience and interface consistency.',
 ARRAY['Create wireframes','User testing','Design prototypes'],
 ARRAY['Figma','User research','Prototyping'],
 23000, 33000, 'Permanent', 'Remote',
 'Remote - México', 'Flexible',
 '2025-01-02', '2025-02-12', '2025-02-01', '2025-02-01 15:30:00',
 'Closed', TRUE, 'Filled'),

(12, 11,
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f',
 'QA Engineer',
 'Ensure product quality through manual and automated testing.',
 ARRAY['Create test cases','Report bugs','Automate tests'],
 ARRAY['Selenium','Postman','Test automation'],
 20000, 29000, 'Full-time', 'Hybrid',
 'León, Guanajuato, MX', 'Mon–Fri 9:00–18:00',
 '2024-12-15', '2025-01-20', '2025-01-18', '2025-01-18 11:45:00',
 'Closed', TRUE, 'Filled'),

(13, 11,
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 '7e237d8c-e3b3-4519-a5a9-784345fd7b1d',
 'DevOps Engineer',
 'Maintain CI/CD pipelines and cloud infrastructure.',
 ARRAY['Manage CI/CD','Monitor servers','Automate deployments'],
 ARRAY['Docker','Kubernetes','AWS'],
 30000, 45000, 'Full-time', 'Remote',
 'Remote - LATAM', 'Mon–Fri 9:00–18:00',
 '2025-01-04', '2025-02-28', NULL, NULL,
 'In interview', FALSE, NULL),

(15, 11,
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 '16f9862c-0cf6-4a4e-8ac8-2b21435cf65f',
 'Data Analyst',
 'Analyze business data and generate reports.',
 ARRAY['Build dashboards','SQL queries','Data cleaning'],
 ARRAY['SQL','Power BI','Excel'],
 21000, 30000, 'Full-time', 'On-site',
 'León, Guanajuato, MX', 'Mon–Fri 9:00–18:00',
 '2025-01-06', '2025-02-14', NULL, NULL,
 'Open', FALSE, NULL),

(20, 7,
 '7e237d8c-e3b3-4519-a5a9-784345fd7b1d',
 '59713ebf-39e7-4796-8ab8-f8202e1728c5',
 'Customer Service Agent',
 'Handle customer inquiries and complaints.',
 ARRAY['Answer calls','Resolve issues','Document interactions'],
 ARRAY['Customer service','CRM systems','Conflict resolution'],
 15000, 22000, 'Part-time', 'On-site',
 'Puebla, PUE, MX', 'Mon–Sat 10:00–16:00',
 '2025-01-07', '2025-01-25', NULL, NULL,
 'Paused', FALSE, NULL);
