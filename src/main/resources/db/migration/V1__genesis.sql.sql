
CREATE TABLE USR_USER (
    `USERNAME` VARCHAR(50) NOT NULL PRIMARY KEY,
    `PASSWORD` VARCHAR(255) NOT NULL,
    `EMAIL` VARCHAR(180) DEFAULT NULL,
    `ENABLED` INT DEFAULT 0
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- admin password = password

-- encryption is bcrypt

INSERT INTO USR_USER
VALUES
('admin','$2a$10$f6KnNYdq6omzg0pXaXpNfOchfCs1wG0wC3PYl5S25WGgVxIxDJ/oi','admin@gmail.com',1),
('admin','$2a$10$f6KnNYdq6omzg0pXaXpNfOchfCs1wG0wC3PYl5S25WGgVxIxDJ/oi','userA@gmail.com',1),
('admin','$2a$10$f6KnNYdq6omzg0pXaXpNfOchfCs1wG0wC3PYl5S25WGgVxIxDJ/oi','userB@gmail.com',1);

CREATE TABLE USR_ROLES (
    `ROLE` VARCHAR(20) NOT NULL PRIMARY KEY
) ENGINE=INNODB DEFAULT CHARSET=latin1;

INSERT INTO USR_ROLES
VALUES
('ROLE_USER'),
('ROLE_ADMIN'),
('ROLE_SYSTEM');

REATE TABLE USR_USER_ROLE (
    `ID` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USERNAME` VARCHAR(50) NOT NULL,
    `ROLE` VARCHAR(20) NOT NULL,
    KEY (`USERNAME`),
    KEY (`ROLE`),
    CONSTRAINT FOREIGN KEY (`USERNAME`) REFERENCES `USR_USER` (`USERNAME`) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (`ROLE`) REFERENCES `USR_ROLES` (`ROLE`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

INSERT INTO USR_USER_ROLE
(`USERNAME`,`ROLE`)
VALUES
('admin','ROLE_ADMIN'),
('admin','ROLE_USER'),
('admin','ROLE_SYSTEM');