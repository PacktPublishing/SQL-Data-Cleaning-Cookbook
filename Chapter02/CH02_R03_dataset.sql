--drop table ch02_r03_project_assignments;
--drop table ch02_r03_employees;
--drop table ch02_r03_projects;
-- Create employees table
CREATE TABLE ch02_r03_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50)
);

-- Create projects table
CREATE TABLE ch02_r03_projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    status VARCHAR(20)
);

-- Create project_assignments table
CREATE TABLE ch02_r03_project_assignments (
    employee_id INT,
    project_id INT,
    assigned_date DATE,
    FOREIGN KEY (employee_id) REFERENCES ch02_r03_employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES ch02_r03_projects(project_id)
);

-- Insert data into employees table
INSERT INTO ch02_r03_employees (employee_id, employee_name, department) VALUES
(1, 'Alice', 'Marketing'),
(2, 'Bob', 'Sales'),
(3, 'Carol', 'Engineering'),
(4, 'David', 'Human Resources'),
(5, 'Eve', 'Finance'),
(6, 'Frank', 'Engineering'),
(7, 'Grace', 'Sales'),
(8, 'Hank', 'Marketing'),
(9, 'Ivy', 'Finance'),
(10, 'Jack', 'Engineering'),
(11, 'Kathy', 'Marketing'),
(12, 'Leo', 'Engineering'),
(13, 'Mia', 'Sales'),
(14, 'Noah', 'Finance'),
(15, 'Olivia', 'Engineering'),
(16, 'Paul', 'Marketing'),
(17, 'Quincy', 'Human Resources'),
(18, 'Rachel', 'Sales'),
(19, 'Sam', 'Finance'),
(20, 'Tina', 'Engineering'),
(21, 'Uma', 'Marketing'),
(22, 'Victor', 'Human Resources'),
(23, 'Wendy', 'Engineering'),
(24, 'Xavier', 'Sales'),
(25, 'Yara', 'Finance'),
(26, 'Zane', 'Engineering'),
(27, 'Bruce', 'Marketing'),
(28, 'Clara', 'Sales'),
(29, 'Dylan', 'Finance'),
(30, 'Emma', 'Engineering');

-- Insert data into projects table
INSERT INTO ch02_r03_projects (project_id, project_name, status) VALUES
(101, 'Project Alpha', 'active'),
(102, 'Project Beta', 'on-hold'),
(103, 'Project Gamma', 'completed'),
(104, 'Project Delta', 'active'),
(105, 'Project Epsilon', 'active'),
(106, 'Project Zeta', 'on-hold'),
(107, 'Project Eta', 'active'),
(108, 'Project Theta', 'completed'),
(109, 'Project Iota', 'active'),
(110, 'Project Kappa', 'on-hold'),
(111, 'Project Lambda', 'active'),
(112, 'Project Mu', 'active'),
(113, 'Project Nu', 'completed'),
(114, 'Project Xi', 'on-hold'),
(115, 'Project Omicron', 'active'),
(116, 'Project Pi', 'completed'),
(117, 'Project Rho', 'active'),
(118, 'Project Sigma', 'active'),
(119, 'Project Tau', 'on-hold'),
(120, 'Project Upsilon', 'active');

-- Insert data into project_assignments table
INSERT INTO ch02_r03_project_assignments (employee_id, project_id, assigned_date) VALUES
(1, 101, '2024-10-01'),
(2, 102, '2024-09-15'),
(3, 101, '2024-10-05'),
(4, 104, '2024-10-10'),
(5, 105, '2024-10-15'),
(6, 105, '2024-10-18'),
(7, 106, '2024-09-20'),
(8, 101, '2024-10-02'),
(9, 109, '2024-10-22'),
(10, 104, '2024-10-23'),
(11, 103, '2024-10-25'),
(12, 107, '2024-10-26'),
(13, 108, '2024-10-27'),
(14, 110, '2024-10-28'),
(15, 111, '2024-10-29'),
(16, 101, '2024-10-30'),
(17, 112, '2024-10-31'),
(19, 114, '2024-10-21'),
(20, 115, '2024-10-20'),
(21, 116, '2024-10-22'),
(22, 117, '2024-10-23'),
(24, 119, '2024-10-25'),
(25, 120, '2024-10-26'),
(26, 102, '2024-09-15'),
(27, 105, '2024-10-27'),
(28, 109, '2024-10-28'),
(29, 110, '2024-10-29');


-- Create project_dependencies table
CREATE TABLE ch02_r03_project_dependencies (
    project_id INT,
    dependent_project_id INT,
    FOREIGN KEY (project_id) REFERENCES ch02_r03_projects(project_id),
    FOREIGN KEY (dependent_project_id) REFERENCES ch02_r03_projects(project_id)
);

-- Create billing table
CREATE TABLE ch02_r03_billing (
    billing_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    hours_billed DECIMAL(5, 2),
    billing_date DATE,
    FOREIGN KEY (employee_id) REFERENCES ch02_r03_employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES ch02_r03_projects(project_id)
);

-- Insert example data for project_dependencies
INSERT INTO ch02_r03_project_dependencies (project_id, dependent_project_id) VALUES
(101, 103),  -- Project Alpha depends on Project Gamma
(102, 105),  -- Project Beta depends on Project Epsilon
(104, 101),  -- Project Delta depends on Project Alpha
(105, NULL);  -- Project Epsilon depends on Invalid Project ID

-- Insert example data for billing table
INSERT INTO ch02_r03_billing (billing_id, employee_id, project_id, hours_billed, billing_date) VALUES
(1, 1, 101, 40.5, '2024-10-15'),  -- Billing for Alice on Project Alpha
(2, 2, 102, 20.0, '2024-09-20'),  -- Billing for Bob on Project Beta
(3, 3, 105, 15.0, '2024-10-10'),  -- Billing for Eve on Project Epsilon
(4, 2, 999, 5.0, '2024-10-22');   -- Billing for Bob on Unassigned Work (incorrect billing scenario)

