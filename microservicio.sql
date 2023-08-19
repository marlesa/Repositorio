#Crear base de datos
create database microservicios;

#Usar base de datos creada
use microservicios;

#Crear tablas de usuarios
CREATE TABLE students (
    id INT PRIMARY KEY,
    numero_control VARCHAR(10),
    nombre VARCHAR(100),
    correo VARCHAR(100),
    passwd VARCHAR(50),
    usuario VARCHAR(50),
    municipio VARCHAR(50),
    estado_civil VARCHAR(20),
    edad INT
);

#Mostrar todo el contenido de la tabla
SELECT * FROM students;

#Insertar datos en la DB
INSERT INTO students (id, numero_control, nombre, correo, passwd, usuario, municipio, estado_civil, edad)
VALUES
    (1, 1220100603, 'ANZO AVALOS MARIA CITLALLI', 'anzo.citlalli@gmail.com', '$Anzo21&Pass', 'anzocitlalli', 
    'Dolores Hidalgo', 'Soltero', 21),
    (2, 1219100524, 'ARREDONDO GONZALEZ DANIEL ENRIQUE', 'arredondo.daniel@gmail.com', '$Arredondo21&Pass', 'arredondodaniel', 
    'Dolores Hidalgo', 'Soltero', 21),
    (3, 1220100317, 'DUARTE VELAZQUEZ DANIEL', 'duarte.daniel@gmail.com', '$Duarte21&Pass', 'duartedaniel', 
    'Dolores Hidalgo', 'Soltero', 21),
    (4, 1220100629, 'GUTIERREZ MARTINEZ VALERIA IVONNE', 'gutierrez.valeria@gmail.com', '$Gutierrez21&Pass', 'gutierrezvaleria', 
    'Dolores Hidalgo', 'Soltero', 21),
    (5, 1220100632, 'LUNA CANTERO ANGEL IVAN', 'luna.angel@gmail.com', '$Luna21&Pass', 'lunaangel', 
    'Dolores Hidalgo', 'Soltero', 21),
    (6, 1220100209, 'MARTINEZ RAMIREZ GUADALUPE MONSERRAT', 'martinez.guadalupe@gmail.com', '$Martinez21&Pass', 'martinezguadalupe', 
    'Dolores Hidalgo', 'Soltero', 21),
    (7, 1220100053, 'REYES MORALES SALVADOR', 'reyes.salvador@gmail.com', '$Reyes21&Pass', 'reyessalvador', 
    'Dolores Hidalgo', 'Soltero', 21),
    (8, 1220100597, 'SALAZAR LEON MARIA GUADALUPE', 'salazar.maria@gmail.com', '$Salazar21&Pass', 'salazarmaria', 
    'Dolores Hidalgo', 'Soltero', 21),
    (9, 1220100596, 'TADEO MARTINEZ ALEJANDRO', 'tadeo.alejandro@gmail.com', '$Tadeo21&Pass', 'tadeoalejandro', 
    'Dolores Hidalgo', 'Soltero', 21),
    (10, 1220100075, 'TORRES GARCIA JOSE ROGELIO', 'torres.jose@gmail.com', '$Torres21&Pass', 'torresjose', 
    'Dolores Hidalgo', 'Soltero', 21),
    (11, 1220100595, 'TRANQUEÑO HERNANDEZ OSCAR ARMANDO', 'tranqueno.oscar@gmail.com', '$Tranqueno21&Pass', 'tranquenooscar', 
    'Dolores Hidalgo', 'Casado', 21);
    
#Mostrar todo el contenido de la tabla
SELECT * FROM students;

