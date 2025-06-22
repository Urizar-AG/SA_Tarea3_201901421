USE SA_T3;

DROP TRIGGER IF EXISTS registar_ci;
DELIMITER //
CREATE TRIGGER registrar_ci AFTER INSERT ON CIS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se registro un nuevo CI', 'INSERT');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS actualizar_ci;
DELIMITER //
CREATE TRIGGER actualizar_ci AFTER UPDATE ON CIS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se actualizo el CI', 'UPDATE');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS eliminar_ci;
DELIMITER //
CREATE TRIGGER eliminar_ci AFTER DELETE ON CIS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se elimino un CI', 'DELETE');
END //
DELIMITER ;


DROP TRIGGER IF EXISTS registar_documentacion;
DELIMITER //
CREATE TRIGGER registrar_documentacion AFTER INSERT ON DOCUMENTACIONES
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se registro una nueva documentacion', 'INSERT');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS actualizar_documentacion;
DELIMITER //
CREATE TRIGGER actualizar_documentacion AFTER UPDATE ON DOCUMENTACIONES
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se actualizo la documentacion', 'UPDATE');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS eliminar_documentacion;
DELIMITER //
CREATE TRIGGER eliminar_documentacion AFTER DELETE ON DOCUMENTACIONES
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se elimino la documentacion del CI', 'DELETE');
END //
DELIMITER ;


DROP TRIGGER IF EXISTS registar_responsable;
DELIMITER //
CREATE TRIGGER registrar_responsable AFTER INSERT ON RESPONSABLES
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se registro un nuevo responsable', 'INSERT');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS actualizar_responsable;
DELIMITER //
CREATE TRIGGER actualizar_responsable AFTER UPDATE ON RESPONSABLES
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se actualizo la informacion de un responsable', 'UPDATE');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS eliminar_responsable;
DELIMITER //
CREATE TRIGGER eliminar_responsable AFTER DELETE ON RESPONSABLES
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se quitó a un responsable', 'DELETE');
END //
DELIMITER ;


DROP TRIGGER IF EXISTS registar_incidente_problema;
DELIMITER //
CREATE TRIGGER registrar_incidente_problema AFTER INSERT ON INCIDENTES_PROBLEMAS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se registro un nuevo incidente/problema', 'INSERT');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS actualizar_incidente_problema;
DELIMITER //
CREATE TRIGGER actualizar_incidente_problema AFTER UPDATE ON INCIDENTES_PROBLEMAS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se actualizo la información de un incidente/problema', 'UPDATE');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS eliminar_incidente_problema;
DELIMITER //
CREATE TRIGGER eliminar_incidente_problema AFTER DELETE ON INCIDENTES_PROBLEMAS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se elimino la informacion de un incidente/problema', 'DELETE');
END //
DELIMITER ;


DROP TRIGGER IF EXISTS registar_cambio;
DELIMITER //
CREATE TRIGGER registrar_cambio AFTER INSERT ON CAMBIOS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se registro un nuevo cambio en un CI', 'INSERT');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS actualizar_cambio;
DELIMITER //
CREATE TRIGGER actualizar_cambio AFTER UPDATE ON CAMBIOS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se la informacion de un cambio en CI', 'UPDATE');
END //
DELIMITER ;

DROP TRIGGER IF EXISTS eliminar_cambio;
DELIMITER //
CREATE TRIGGER eliminar_cambio AFTER DELETE ON CAMBIOS
FOR EACH ROW
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = NOW();
    INSERT INTO LOGS (fecha, descripcion, tipo)
    VALUES (fecha, 'Se elimino la informacion de un cambio de CI', 'DELETE');
END //
DELIMITER ;
