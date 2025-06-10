CREATE ROLE admin_role NOLOGIN;
CREATE ROLE project_manager_role NOLOGIN;
CREATE ROLE developer_role NOLOGIN;
CREATE ROLE tester_role NOLOGIN;

CREATE USER jan_kowalski WITH PASSWORD 'tajnehaslo123';
GRANT admin_role TO jan_kowalski;

CREATE USER anna_nowak WITH PASSWORD 'tajnehaslo123!';
GRANT project_manager_role TO anna_nowak;

CREATE USER marek_wisniewski WITH PASSWORD 'tajnehaslo123';
GRANT developer_role TO marek_wisniewski;

CREATE USER piotr_malinowski WITH PASSWORD 'TestPiotr2025';
GRANT tester_role TO piotr_malinowski;

GRANT CONNECT ON DATABASE postgres TO admin_role, project_manager_role, developer_role, tester_role;

GRANT USAGE ON SCHEMA sys_zarz_pro_pro TO admin_role, project_manager_role, developer_role, tester_role;

-- Administrator dostaje wszystkie uprawnienia
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA sys_zarz_pro_pro TO admin_role;

-- Project Manager może tworzyć/aktualizować projekty i zadania
GRANT SELECT, INSERT, UPDATE, DELETE ON sys_zarz_pro_pro.projekt, sys_zarz_pro_pro.zadanie, sys_zarz_pro_pro.status  TO project_manager_role;

-- Developer może czytać i modyfikować tylko zadania i rejestrować czas pracy
GRANT SELECT, INSERT, UPDATE ON sys_zarz_pro_pro.zadanie, sys_zarz_pro_pro.czas_pracy TO developer_role;

-- Tester może czytać zadania i aktualizować ich statusy
GRANT SELECT, UPDATE ON sys_zarz_pro_pro.zadanie TO tester_role;