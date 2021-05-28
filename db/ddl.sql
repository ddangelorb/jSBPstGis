CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    avatar VARCHAR(100) NULL,
    active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS profiles
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS usersprofiles
(
    id SERIAL PRIMARY KEY,
    idusers INT NOT NULL,
    idprofiles INT NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idusers) REFERENCES users (id),
    FOREIGN KEY (idprofiles) REFERENCES profiles (id)
);

CREATE TABLE IF NOT EXISTS permissions
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS profilespermissions
(
    id SERIAL PRIMARY KEY,
    idprofiles INT NOT NULL,
    idpermissions INT NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idprofiles) REFERENCES profiles (id),
    FOREIGN KEY (idpermissions) REFERENCES permissions (id)
);

CREATE TABLE IF NOT EXISTS formsorigins
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS forms
(
    id SERIAL PRIMARY KEY,
    idformsorigins INT NOT NULL,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    dtcreation TIMESTAMP NOT NULL DEFAULT NOW(),
    active INT NOT NULL,
    FOREIGN KEY (idformsorigins) REFERENCES formsorigins (id)
);

CREATE TABLE IF NOT EXISTS fieldsdatatypes
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS fields
(
    id SERIAL PRIMARY KEY,
    idfieldsdatatypes INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    fillingclue VARCHAR(100) NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idfieldsdatatypes) REFERENCES fieldsdatatypes (id)
);

CREATE TABLE IF NOT EXISTS formsfields
(
    id SERIAL PRIMARY KEY,
    idforms INT NOT NULL,
    idfields INT NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idforms) REFERENCES forms (id),
    FOREIGN KEY (idfields) REFERENCES fields (id)
);

CREATE TABLE IF NOT EXISTS alternatives
(
    id SERIAL PRIMARY KEY,
    response VARCHAR(100) NOT NULL,
    shortresponse VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS fieldsalternatives
(
    id SERIAL PRIMARY KEY,
    idfields INT NOT NULL,
    idalternatives INT NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idfields) REFERENCES fields (id),
    FOREIGN KEY (idalternatives) REFERENCES alternatives (id)
);

CREATE TABLE IF NOT EXISTS formsanswers
(
    id SERIAL PRIMARY KEY,
    idforms INT NOT NULL,
    idusersinformer INT NOT NULL,
    dtfilling TIMESTAMP NOT NULL,
    latitude NUMERIC NULL,
    longitude NUMERIC NULL,
    FOREIGN KEY (idforms) REFERENCES forms (id),
    FOREIGN KEY (idusersinformer) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS fieldsanswers
(
    id SERIAL PRIMARY KEY,
    idfields INT NOT NULL,
    idformsanswers INT NOT NULL,
    value VARCHAR(100) NULL,
    FOREIGN KEY (idfields) REFERENCES fields (id),
    FOREIGN KEY (idformsanswers) REFERENCES formsanswers (id)
);
SELECT AddGeometryColumn('','fieldsanswers','geom','4326','MULTIPOLYGON',2);

CREATE TABLE IF NOT EXISTS usersendorsementfieldsanswers
(
    id SERIAL PRIMARY KEY,
    idusersendorsement INT NOT NULL,
    idfieldsanswers INT NOT NULL,
    latitude NUMERIC NULL,
    longitude NUMERIC NULL,
    istrustable INT NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idusersendorsement) REFERENCES users (id),
    FOREIGN KEY (idfieldsanswers) REFERENCES fieldsanswers (id)
);

CREATE TABLE IF NOT EXISTS preliminarydata
(
    id SERIAL PRIMARY KEY,
    idfieldsanswers INT NOT NULL,
    dtinsert TIMESTAMP NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idfieldsanswers) REFERENCES fieldsanswers (id)
);

CREATE TABLE IF NOT EXISTS trusteddata
(
    id SERIAL PRIMARY KEY,
    idfieldsanswers INT NOT NULL,
    dtinsert TIMESTAMP NOT NULL,
    active INT NOT NULL,
    FOREIGN KEY (idfieldsanswers) REFERENCES fieldsanswers (id)
);
