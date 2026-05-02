-- =============================================================================
-- PROYECTO: BANCO CORE (BASADO EN DOMAIN-DRIVEN DESIGN - DDD)
-- AMBIENTE: VS CODE / MYSQL
-- =============================================================================

DROP DATABASE IF EXISTS `bancocore`;
CREATE DATABASE `bancocore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bancocore`;

-- =============================================================================
-- FASE 1: ESTRUCTURACIÓN DEL DOMINIO (TABLAS Y RELACIONES)
-- =============================================================================

-- 1. Entidad: Cliente Persona
CREATE TABLE `cliente_persona` (
  `ID_Identificacion` VARCHAR(20) NOT NULL,
  `Nombre_Completo` VARCHAR(100) NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(15) DEFAULT NULL,
  `Fecha_Nacimiento` DATE DEFAULT NULL,
  `Direccion` VARCHAR(150) DEFAULT NULL,
  PRIMARY KEY (`ID_Identificacion`),
  CONSTRAINT `uq_persona_correo` UNIQUE (`Correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Entidad: Cliente Empresa
CREATE TABLE `cliente_empresa` (
  `NIT` VARCHAR(20) NOT NULL,
  `Razon_Social` VARCHAR(100) NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(15) DEFAULT NULL,
  `Direccion` VARCHAR(150) DEFAULT NULL,
  `Representante_Legal` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`NIT`),
  CONSTRAINT `uq_empresa_correo` UNIQUE (`Correo`),
  CONSTRAINT `fk_empresa_representante` 
    FOREIGN KEY (`Representante_Legal`) REFERENCES `cliente_persona` (`ID_Identificacion`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Entidad: Cuenta Bancaria
CREATE TABLE `cuenta_bancaria` (
  `Numero_Cuenta` VARCHAR(20) NOT NULL,
  `Tipo_Cuenta` ENUM('Ahorros', 'Corriente') NOT NULL,
  `ID_Titular` VARCHAR(20) NOT NULL,
  `Saldo_Actual` DECIMAL(18,2) NOT NULL DEFAULT 0.00,
  `Moneda` VARCHAR(10) NOT NULL DEFAULT 'COP',
  `Estado_Cuenta` ENUM('Activa', 'Inactiva', 'Bloqueada') NOT NULL DEFAULT 'Activa',
  `Fecha_Apertura` DATE NOT NULL,
  PRIMARY KEY (`Numero_Cuenta`),
  CONSTRAINT `fk_cuenta_titular` 
    FOREIGN KEY (`ID_Titular`) REFERENCES `cliente_persona` (`ID_Identificacion`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Entidad/Objeto de Valor: Bitácora (Auditoría del Dominio)
CREATE TABLE `bitacora` (
  `ID_Bitacora` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Operacion` VARCHAR(50) NOT NULL,
  `Fecha_Hora_Operacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_Producto_Afectado` VARCHAR(50) DEFAULT NULL,
  `Datos_Detalle` JSON DEFAULT NULL,
  PRIMARY KEY (`ID_Bitacora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =============================================================================
-- FASE 2: INVARIANTES DEL DOMINIO (TRIGGERS)
-- =============================================================================

-- Trigger 1: Regla de Validación de Saldo Mínimo en Ahorros
DROP TRIGGER IF EXISTS `trg_validar_saldo_ahorros`;
DELIMITER $$
CREATE TRIGGER `trg_validar_saldo_ahorros`
BEFORE UPDATE ON `cuenta_bancaria`
FOR EACH ROW
BEGIN
    IF NEW.Tipo_Cuenta = 'Ahorros' AND NEW.Saldo_Actual < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error de Dominio: Una cuenta de ahorros no puede quedar con saldo negativo.';
    END IF;
END$$
DELIMITER ;

-- Trigger 2: Auditoría Automática de Eventos de Cuenta
DROP TRIGGER IF EXISTS `trg_auditoria_cuenta`;
DELIMITER $$
CREATE TRIGGER `trg_auditoria_cuenta`
AFTER UPDATE ON `cuenta_bancaria`
FOR EACH ROW
BEGIN
    IF OLD.Saldo_Actual <> NEW.Saldo_Actual OR OLD.Estado_Cuenta <> NEW.Estado_Cuenta THEN
        INSERT INTO `bitacora` (
            `Tipo_Operacion`, 
            `Fecha_Hora_Operacion`, 
            `ID_Producto_Afectado`, 
            `Datos_Detalle`
        ) VALUES (
            'Actualización de Cuenta',
            NOW(),
            NEW.Numero_Cuenta,
            JSON_OBJECT(
                'saldo_anterior', OLD.Saldo_Actual,
                'saldo_nuevo', NEW.Saldo_Actual,
                'estado_anterior', OLD.Estado_Cuenta,
                'estado_nuevo', NEW.Estado_Cuenta,
                'diferencia', (NEW.Saldo_Actual - OLD.Saldo_Actual)
            )
        );
    END IF;
END$$
DELIMITER ;


-- =============================================================================
-- FASE 3: FUNCIONALIDADES / SERVICIOS (PROCEDIMIENTOS ALMACENADOS)
-- =============================================================================

-- 1. Servicio: Registrar Cliente Persona
DROP PROCEDURE IF EXISTS `sp_registrar_cliente_persona`;
DELIMITER $$
CREATE PROCEDURE `sp_registrar_cliente_persona`(
    IN p_ID VARCHAR(20),
    IN p_Nombre VARCHAR(100),
    IN p_Correo VARCHAR(100),
    IN p_Telefono VARCHAR(15),
    IN p_Fecha_Nac DATE,
    IN p_Direccion VARCHAR(150)
)
BEGIN
    INSERT INTO `cliente_persona` (
        `ID_Identificacion`, `Nombre_Completo`, `Correo`, `Telefono`, `Fecha_Nacimiento`, `Direccion`
    ) VALUES (
        p_ID, p_Nombre, p_Correo, p_Telefono, p_Fecha_Nac, p_Direccion
    );
END$$
DELIMITER ;

-- 2. Servicio: Registrar Cliente Empresa
DROP PROCEDURE IF EXISTS `sp_registrar_cliente_empresa`;
DELIMITER $$
CREATE PROCEDURE `sp_registrar_cliente_empresa`(
    IN p_NIT VARCHAR(20),
    IN p_Razon_Social VARCHAR(100),
    IN p_Correo VARCHAR(100),
    IN p_Telefono VARCHAR(15),
    IN p_Direccion VARCHAR(150),
    IN p_Representante VARCHAR(20)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM `cliente_persona` WHERE `ID_Identificacion` = p_Representante) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: El representante legal no existe.';
    ELSE
        INSERT INTO `cliente_empresa` (
            `NIT`, `Razon_Social`, `Correo`, `Telefono`, `Direccion`, `Representante_Legal`
        ) VALUES (
            p_NIT, p_Razon_Social, p_Correo, p_Telefono, p_Direccion, p_Representante
        );
    END IF;
END$$
DELIMITER ;

-- 3. Servicio: Abrir Cuenta Bancaria
DROP PROCEDURE IF EXISTS `sp_abrir_cuenta`;
DELIMITER $$
CREATE PROCEDURE `sp_abrir_cuenta`(
    IN p_Numero_Cuenta VARCHAR(20),
    IN p_Tipo_Cuenta VARCHAR(30),
    IN p_ID_Titular VARCHAR(20),
    IN p_Saldo_Inicial DECIMAL(18,2),
    IN p_Moneda VARCHAR(10)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM `cliente_persona` WHERE `ID_Identificacion` = p_ID_Titular) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: El titular no existe.';
    ELSE
        INSERT INTO `cuenta_bancaria` (
            `Numero_Cuenta`, `Tipo_Cuenta`, `ID_Titular`, `Saldo_Actual`, `Moneda`, `Estado_Cuenta`, `Fecha_Apertura`
        ) VALUES (
            p_Numero_Cuenta, p_Tipo_Cuenta, p_ID_Titular, p_Saldo_Inicial, p_Moneda, 'Activa', CURDATE()
        );
    END IF;
END$$
DELIMITER ;

-- 4. Servicio: Consignación (Depósito)
DROP PROCEDURE IF EXISTS `sp_consignar`;
DELIMITER $$
CREATE PROCEDURE `sp_consignar`(
    IN p_Numero_Cuenta VARCHAR(20),
    IN p_Monto DECIMAL(18,2)
)
BEGIN
    IF p_Monto <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: El monto a consignar debe ser mayor a cero.';
    ELSEIF NOT EXISTS (SELECT 1 FROM `cuenta_bancaria` WHERE `Numero_Cuenta` = p_Numero_Cuenta AND `Estado_Cuenta` = 'Activa') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: Cuenta no válida o inactiva.';
    ELSE
        UPDATE `cuenta_bancaria`
        SET `Saldo_Actual` = `Saldo_Actual` + p_Monto
        WHERE `Numero_Cuenta` = p_Numero_Cuenta;
    END IF;
END$$
DELIMITER ;

-- 5. Servicio: Retiro de Efectivo
DROP PROCEDURE IF EXISTS `sp_retirar`;
DELIMITER $$
CREATE PROCEDURE `sp_retirar`(
    IN p_Numero_Cuenta VARCHAR(20),
    IN p_Monto DECIMAL(18,2)
)
BEGIN
    DECLARE v_Saldo DECIMAL(18,2);
    DECLARE v_Tipo VARCHAR(30);

    SELECT `Saldo_Actual`, `Tipo_Cuenta` INTO v_Saldo, v_Tipo
    FROM `cuenta_bancaria`
    WHERE `Numero_Cuenta` = p_Numero_Cuenta AND `Estado_Cuenta` = 'Activa';

    IF v_Saldo IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: Cuenta no válida o inactiva.';
    ELSEIF p_Monto <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: El monto a retirar debe ser mayor a cero.';
    ELSEIF v_Tipo = 'Ahorros' AND (v_Saldo - p_Monto) < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: Fondos insuficientes para este retiro.';
    ELSE
        UPDATE `cuenta_bancaria`
        SET `Saldo_Actual` = `Saldo_Actual` - p_Monto
        WHERE `Numero_Cuenta` = p_Numero_Cuenta;
    END IF;
END$$
DELIMITER ;

-- 6. Servicio: Transferencia entre Cuentas (Transaccional)
DROP PROCEDURE IF EXISTS `sp_transferir`;
DELIMITER $$
CREATE PROCEDURE `sp_transferir`(
    IN p_Cuenta_Origen VARCHAR(20),
    IN p_Cuenta_Destino VARCHAR(20),
    IN p_Monto DECIMAL(18,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transacción abortada: Se ha cancelado la transferencia.';
    END;

    START TRANSACTION;
        IF p_Monto <= 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error de Dominio: El monto debe ser mayor a cero.';
        END IF;

        -- Descontar de la cuenta de origen
        UPDATE `cuenta_bancaria`
        SET `Saldo_Actual` = `Saldo_Actual` - p_Monto
        WHERE `Numero_Cuenta` = p_Cuenta_Origen AND `Estado_Cuenta` = 'Activa';

        -- Incrementar en la cuenta de destino
        UPDATE `cuenta_bancaria`
        SET `Saldo_Actual` = `Saldo_Actual` + p_Monto
        WHERE `Numero_Cuenta` = p_Cuenta_Destino AND `Estado_Cuenta` = 'Activa';
    COMMIT;
END$$
DELIMITER ;