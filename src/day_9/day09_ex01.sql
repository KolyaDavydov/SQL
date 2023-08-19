 --создаем тригерную функцию для UPDATE
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $$
    BEGIN
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit(created, type_event ,row_id, name, age, gender, address)
            SELECT NOW(), 'U', OLD.*;
        END IF;
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

 -- апдейтим данные
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- и можно увидеть что данные обновлялись
-- select * from person;