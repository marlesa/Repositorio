'''
    Autor: Salazar León Maria Guadalupe
    Fecha: 18 Agosto 2023
    Descripción: Desarrollo de microservicios
'''

# Importar las librerías necesarias
from flask import Flask, jsonify, request, session, redirect, url_for
import pymysql

# Crear una instancia de la aplicación Flask
app = Flask(__name__)

# Configuración de la aplicación Flask
app.secret_key = 'mleon$'  
app.config['MYSQL_DATABASE_HOST'] = 'localhost'  
app.config['MYSQL_DATABASE_USER'] = 'root'  
app.config['MYSQL_DATABASE_PASSWORD'] = 'maRia468/'  
app.config['MYSQL_DATABASE_DB'] = 'microservicios'  

# Conexión a la base de datos MySQL 
mysql = pymysql.connect(
    host=app.config['MYSQL_DATABASE_HOST'],
    user=app.config['MYSQL_DATABASE_USER'],
    password=app.config['MYSQL_DATABASE_PASSWORD'],
    db=app.config['MYSQL_DATABASE_DB']
)

#Inicio de sesión
@app.route('/login', methods=['POST'])
def login():
    datos = request.get_json()  
    correo = datos.get('correo')  
    passwd = datos.get('passwd')  

    cursor = mysql.cursor(pymysql.cursors.DictCursor)  
    cursor.execute('SELECT * FROM students WHERE correo = %s', (correo,))
    students = cursor.fetchone()  

    if students:
        stored_password = students['passwd']  

        if stored_password == passwd:
            session['logged_in'] = True  
            return {'message': 'Inicio exitoso'}  
        else:
            return {'error': 'Credenciales inválidas'}, 401  
    else:
        return {'error': 'Usuario no encontrado'}, 404  

#Obtener datos de la DB
@app.route('/datos', methods=['GET'])
def datos():
    if 'logged_in' not in session or not session['logged_in']:
        return redirect(url_for('login'))  

    cursor = mysql.cursor(pymysql.cursors.DictCursor)  
    cursor.execute('SELECT * FROM students')
    students = cursor.fetchall()  

    return jsonify(students)

#Actualizar y agregar datos a la DataBase
@app.route('/agregar', methods=['POST'])
def agregar():
    try:
        datos = request.get_json()  
        id = datos.get('id')
        numero_control = datos.get('numero_control')  
        nombre = datos.get('nombre')  
        correo = datos.get('correo')  
        passwd = datos.get('passwd')  
        usuario = datos.get('usuario')
        municipio = datos.get('municipio')
        estado_civil = datos.get('estado_civil')
        edad = datos.get('edad')  

        cursor = mysql.cursor()  
        cursor.execute(
            'INSERT INTO students (id, numero_control, nombre, correo, passwd, usuario, municipio, estado_civil, edad) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)',
            (id, numero_control, nombre, correo, passwd, usuario, municipio, estado_civil, edad))
        mysql.commit()  

        return {'message': 'Usuario agregado'}, 201  
    except Exception as e:
        return {'error': 'Error al agregar usuario', 'details': str(e)}, 400

#Eliminar usuario de la base de datos
@app.route('/eliminar', methods=['DELETE'])
def eliminar():
    try:
        datos = request.get_json()  
        numero_control = datos.get('numero_control')  

        cursor = mysql.cursor()  
        cursor.execute('DELETE FROM students WHERE numero_control = %s', (numero_control,))
        mysql.commit()  

        if cursor.rowcount > 0:
            return {'message': 'Usuario eliminado'}, 200  
        else:
            return {'error': 'Usuario no encontrado'}, 404  
    except Exception as e:
        return {'error': 'Error al eliminar usuario', 'details': str(e)}, 400