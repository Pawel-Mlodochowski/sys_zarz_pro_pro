# sys_zarz_pro_pro
Projekt z baz danych - semestr 4

Temat projektu:
System zarządzania zespołem programistycznych

Poniżej lista dostępnych skryptów wraz z krótkim opisem ich funkcji:

1. init.sql
   Inicjalizuje środowisko w istniejącej bazie `postgres`:  
   - Tworzy schemat `sys_zarz_pro_pro` (jeśli nie istnieje)  
   - Tworzy podstawową strukturę tabel: `rola`, `status`, `projekt`, `uzytkownik`, `zadanie`, `zadanie_uzytkownik`, `czas_pracy`  
   - Dodaje indeksy dla relacji  

2. add-data.sql  
   Dodaje przykładowe dane do tabel utworzonych przez `init.sql`

3. select.sql
   Zestaw przykładowych zapytań SELECT 

4. zaawansowane_skrypty.sql 
   Pokazuje bardziej zaawansowane operacje SQL

5. funkcje_procedury.sql
   Tworzy i testuje logikę biznesową po stronie bazy. Zawiera funkcje i procedury

6. prod.sql
   Tworzy oddzielną bazę danych produkcyjną o nazwie `sys_zarz_db_prod` 

7. role-proj.sql  
   Zarządza rolami i użytkownikami w PostgreSQL:  
   - Definiuje role: `admin_role`, `project_manager_role`, `developer_role`, `tester_role`  
   - Tworzy użytkowników i nadaje im role  
