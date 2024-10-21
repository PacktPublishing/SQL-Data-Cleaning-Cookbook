-- ## Addressing Missing Data in Joins ##

-- Step 1: Detect Missing Assignments in Both Directions
    -- Detect projects without employees assigned
    SELECT p.project_id AS id, p.project_name AS name, p.status AS status, NULL AS employee_department
    FROM ch02_r03_projects p
    LEFT JOIN ch02_r03_project_assignments pa 
      ON p.project_id = pa.project_id
    WHERE pa.employee_id IS NULL;

-- Detect employees not assigned to any active projects
SELECT e.employee_id, e.employee_name, e.department
FROM ch02_r03_employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM ch02_r03_project_assignments pa
    JOIN ch02_r03_projects p ON pa.project_id = p.project_id
    WHERE pa.employee_id = e.employee_id
      AND p.status = 'active'
);


-- Step2: Create the “Unassigned Employee” and “Unassigned Work” project (if they don’t exist yet)
-- Ensure "Unassigned Employee" exists
INSERT INTO ch02_r03_employees (employee_id, employee_name, department)
SELECT 999, 'Unassigned Employee', 'General'
WHERE NOT EXISTS (
    SELECT 1 FROM ch02_r03_employees WHERE employee_id = 999
);
-- Ensure "Unassigned Work" project exists
INSERT INTO ch02_r03_projects (project_id, project_name, status)
SELECT 999, 'Unassigned Work', 'active'
WHERE NOT EXISTS (
    SELECT 1 FROM ch02_r03_projects WHERE project_id = 999
);

-- Step3: Assign employees with no project to the “Unassigned Work” project 
-- and Assign the “Unassigned Employee” to projects with no employees assigned

-- Assign employees who aren't assigned to any active projects to 'Unassigned Work'
INSERT INTO ch02_r03_project_assignments (employee_id, project_id, assigned_date)
SELECT e.employee_id, 999 AS project_id, CURRENT_DATE AS assigned_date
FROM ch02_r03_employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM ch02_r03_project_assignments pa
    JOIN ch02_r03_projects p ON pa.project_id = p.project_id
    WHERE pa.employee_id = e.employee_id
      AND p.status = 'active' 
) and e.employee_id <> 999
	
--Step 4: Assign the “Unassigned Employee” to projects with no employees assigned
-- Assign the "Unassigned Employee" to projects that have no employees assigned
INSERT INTO ch02_r03_project_assignments (employee_id, project_id, assigned_date)
SELECT 999 AS employee_id, p.project_id, CURRENT_DATE AS assigned_date
FROM ch02_r03_projects p
LEFT JOIN ch02_r03_project_assignments pa 
  ON p.project_id = pa.project_id
WHERE pa.employee_id IS NULL and p.project_id<>999;

