CREATE TABLE IF NOT EXISTS bonuses (
  bonus_id VARCHAR(10) PRIMARY KEY,
  employee_id VARCHAR(7) NOT NULL CHECK (employee_id ~ '^ATS0[0-9]{3}$' AND employee_id <> 'ATS0000'),
  employee_name VARCHAR(40) NOT NULL,
  employee_email VARCHAR(40) NOT NULL CHECK (employee_email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|in|org|co\.in)$'),
  bonus_type VARCHAR(20) NOT NULL CHECK (bonus_type IN ('Performance', 'Festival', 'Project Completion', 'Retention', 'Referral')),
  amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
  month_year VARCHAR(20) NOT NULL CHECK (month_year ~* '^[A-Za-z]+ [0-9]{4}$'),
  reason VARCHAR(200),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);