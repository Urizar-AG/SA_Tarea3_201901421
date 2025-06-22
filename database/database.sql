CREATE DATABASE IF NOT EXISTS SA_T3;
USE SA_T3;

CREATE TABLE IF NOT EXISTS RESPONSABLES(
    id_responsable INT AUTO_INCREMENT,
    propietario VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_responsable)
);

CREATE TABLE IF NOT EXISTS CIS(
    id_ci INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(25) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    numero_serie VARCHAR(25) NOT NULL,
    version VARCHAR(10) NOT NULL,
    fecha_adquision DATE NOT NULL,
    estado_actual VARCHAR(25) NOT NULL,
    relaciones VARCHAR(25) NOT NULL,
    padres_hijos VARCHAR(100),
    ubicacion_fisica VARCHAR(100) NOT NULL,
    id_responsable INT NOT NULL,
    nivel_seguridad VARCHAR(25) NOT NULL,
    cumplimiento VARCHAR(25) NOT NULL,
    estado_configuracion VARCHAR(25) NOT NULL,
    numero_licencia VARCHAR(25) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    PRIMARY KEY(id_ci),
    FOREIGN KEY(id_responsable) REFERENCES RESPONSABLES(id_responsable) 
);

CREATE TABLE IF NOT EXISTS DOCUMENTACIONES(
    id_documentacion INT AUTO_INCREMENT,
    documentacion_relacionada VARCHAR(255) NOT NULL,
    id_ci INT NOT NULL,
    PRIMARY KEY(id_documentacion),
    FOREIGN KEY(id_ci) REFERENCES CIS(id_ci)
);

CREATE TABLE IF NOT EXISTS INCIDENTES_PROBLEMAS(
    id_incidente_problema INT AUTO_INCREMENT,
    incidente_problema VARCHAR(255) NOT NULL,
    id_ci INT NOT NULL,
    PRIMARY KEY(id_incidente_problema),
    FOREIGN KEY(id_ci) REFERENCES CIS(id_ci)
);

CREATE TABLE IF NOT EXISTS CAMBIOS(
    id_cambio INT AUTO_INCREMENT,
    fecha_cambio DATE NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    id_ci INT NOT NULL,
    PRIMARY KEY(id_cambio),
    FOREIGN KEY(id_ci) REFERENCES CIS(id_ci)
);

CREATE TABLE LOGS(
    id_log INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    PRIMARY KEY(id_log)
);
