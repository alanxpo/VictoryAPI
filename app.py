"""
VictoryAPI: Una API REST para el boxeo

Este código representa VictoryAPI, una API creada para manejar datos relacionados con el boxeo.
La API requiere autenticación JWT y admite el registro de acceso a los endpoints.

Endpoints:
- /api/sql/boxeadores: Recupera una lista de boxeadores de la base de datos.
- /api/sql/boxeadores/{id}: Recupera un boxeador específico de la base de datos.
- /api/sql/estadios: Recupera una lista de estadios de boxeo de la base de datos.
- /api/sql/entrenadores: Recupera una lista de entrenadores de boxeo de la base de datos.
- /api/sql/categorias: Recupera una lista de categorías de boxeo de la base de datos.

"""
import hashlib
import json
from datetime import datetime, timedelta
import platform
from functools import wraps
import mysql.connector
from flask import Flask, render_template, request, redirect, url_for, jsonify
from flask_jwt_extended import jwt_required, JWTManager, get_jwt_identity, create_access_token
from user_agents import parse

app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = 'alanmuro'
jwt = JWTManager(app)

connectionDatabase = {
    'user': 'root',
    'password': 'Apivictory21!',
    'host': 'localhost',
    'database': 'victoryapi',
    'auth_plugin': 'mysql_native_password'
}


def log_access(func):
    """ Funcion que registra el acceso a una ruta """

    @wraps(func)
    def create_log(*args, **kwargs):
        token = get_jwt_identity()
        user_id = token
        endpoint = request.endpoint
        start_time = datetime.now()
        connection = mysql.connector.connect(**connectionDatabase)
        mycursor = connection.cursor()
        mycursor.execute(
            'SELECT register_date FROM users WHERE id = %s', (user_id,))
        register_date = mycursor.fetchone()
        new_log = "INSERT INTO endpointlogs (userID, endpoint, startTime, register_date) " \
                  "VALUES (%s, %s, %s, %s)"
        add = (user_id, endpoint, start_time, register_date[0])
        mycursor.execute(new_log, add)
        connection.commit()
        connection.close()
        return func(*args, **kwargs)

    return create_log


@app.route('/')
def home():
    """ Ruta principal de la API """
    return render_template('home.html')


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    """ Ruta que gestiona las solicitudes de registro de usuarios """
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password'].encode('utf-8')
        connection = mysql.connector.connect(**connectionDatabase)
        cursor = connection.cursor()
        cursor.execute(
            'SELECT * FROM users WHERE username = %s', (username,))
        user = cursor.fetchone()
        if user:
            connection.close()
            return jsonify({'mensaje': 'El usuario ya existe'}), 400
        password_hash = hashlib.sha256(password).hexdigest()
        register_date = datetime.now()
        sql = "INSERT INTO users (username, password, register_date) VALUES (%s, %s, %s)"
        add = (username, password_hash, register_date)
        cursor.execute(sql, add)
        connection.commit()
        connection.close()
        return redirect(url_for('login', json=request.form), code=307)

    return render_template('signup.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    """ Ruta qestiona las solicitudes de acceso de usuarios a la API """
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password'].encode('utf-8')
        connection = mysql.connector.connect(**connectionDatabase)
        mycursor = connection.cursor()
        sql = "SELECT * FROM users WHERE username = %s"
        add = (username,)
        mycursor.execute(sql, add)
        user = mycursor.fetchone()

        if user is None or hashlib.sha256(password).hexdigest() != user[2]:
            connection.close()
            return jsonify({"msg": "Credenciales inválidas"}), 401

        token = create_access_token(identity=user[0])
        time = datetime.now()
        expire = time + timedelta(minutes=10)
        user_agent = request.headers.get('User-Agent')
        user_agent_parsed = parse(user_agent)
        user_browser = user_agent_parsed.browser.family
        new_session = "INSERT INTO sessions (userID, token, browser, os, createdAt, " \
                      "expiresAt) VALUES (%s, %s, %s,%s,%s,%s)"
        add = (user[0], token, user_browser,
               platform.system(), time, expire)
        mycursor.execute(new_session, add)
        connection.commit()
        connection.close()

        return jsonify({
            "AccessToken": token,
            "UserID": user[0],
            "Browser": user_browser,
            "OperativeSystem": platform.system(),
            "CreatedAt": time.strftime('%Y-%m-%d %H:%M:%S'),
            "ExpiredAt": expire.strftime('%Y-%m-%d %H:%M:%S')
        }), 200
    return render_template('login.html')


@app.route('/api/sql/boxeadores')
@jwt_required()
@log_access
def get_boxeadores():
    """ Ruta que recupera una lista de boxeadores de la base de datos y los muestra en un JSON """
    connection = mysql.connector.connect(**connectionDatabase)
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM boxeador")
    data = cursor.fetchall()
    cursor.close()
    boxeadores = []
    for row in data:
        boxeador = {
            'id': row[0],
            'nombre': row[1] + " " + row[2],
            'peso': row[3],
            'altura': row[4],
            'edad': row[5],
            'record': row[6],
            'categoria': row[7],
            'nacionalidad': row[8],
            'ciudad': row[9],
            'entrenador': row[10]
        }
        boxeadores.append(boxeador)
    return jsonify(boxeadores)


# Definición de ruta para obtener un boxeador específico
@app.route('/api/sql/boxeadores/<int:id_boxeador>')
@jwt_required()
@log_access
def get_boxeador(id_boxeador):
    """ Ruta que recupera un boxeador en especifico de la base de datos y los muestra en un JSON """
    connection = mysql.connector.connect(**connectionDatabase)
    cursor = connection.cursor()
    cursor.execute(
        "SELECT boxeador.id, boxeador.name, boxeador.last_name, boxeador.weight, "
        "boxeador.height, boxeador.age, boxeador.record, boxeador.category, "
        "boxeador.nationality, boxeador.city, boxeador.trainer "
        "FROM boxeador "
        "WHERE boxeador.id=%s", [id_boxeador]
    )

    data = cursor.fetchall()
    cursor.close()
    if len(data) == 0:
        return jsonify({'mensaje': 'No se encontro el boxeador solicitado'})
    boxeadores = []
    for row in data:
        boxeador = {
            'id': row[0],
            'nombre': row[1] + " " + row[2],
            'peso': row[3],
            'altura': row[4],
            'edad': row[5],
            'record': row[6],
            'categoria': row[7],
            'nacionalidad': row[8],
            'ciudad': row[9],
            'entrenador': row[10]
        }
        boxeadores.append(boxeador)
    return jsonify(boxeadores)


# Definición de ruta para obtener todos los estadios
@app.route('/api/sql/estadios')
@jwt_required()
@log_access
def get_estadios():
    """ Ruta que recupera una lista de estadios de la base de datos y los muestra en un JSON """
    connection = mysql.connector.connect(
        **connectionDatabase
    )
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM estadios")
    data = cursor.fetchall()
    cursor.close()
    estadios = []
    for row in data:
        estadios_boxeo = {
            'id': row[0],
            'nombre': row[1],
            'ciudad': row[2],
            'capacidad': row[3],
            'inaugurado': row[4]}
        estadios.append(estadios_boxeo)
    return jsonify(estadios)


# Definición de ruta para obtener todos los entrenadores
@app.route('/api/sql/entrenadores')
@jwt_required()
@log_access
def get_entrenadores():
    """ Ruta que recupera una lista de entrenadores de la base de datos y los muestra en un JSON """
    connection = mysql.connector.connect(**connectionDatabase)
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM entrenadores")
    data = cursor.fetchall()
    cursor.close()
    entrenador = []
    for row in data:
        entrenadores = {
            'id': row[0],
            'nombre': row[1],
            'edad': row[2],
            'nacionalidad': row[3],
            'experiencia': row[4],
            'idBoxeadorEntrenado': row[5]}
        entrenador.append(entrenadores)
    return jsonify(entrenador)


# Definición de ruta para obtener todas las categorias
@app.route('/api/sql/categorias')
@jwt_required()
@log_access
def get_categorias():
    """ Ruta que recupera una lista de categorias de la base de datos y las muestra en un JSON """
    connection = mysql.connector.connect(**connectionDatabase)
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM categoria")
    data = cursor.fetchall()
    cursor.close()
    categorias = []
    for row in data:
        categoria = {
            'id': row[0],
            'nombre': row[1],
            'pesoMinimo': row[2],
            'pesoMaximo': row[3]}
        categorias.append(categoria)
    return jsonify(categorias)


@app.route("/about")
def about():
    """ Ruta que devuelve el JSON de la información de la API"""
    with open('victoryapi.json', encoding='utf-8') as file:
        display = json.load(file)
    return jsonify(display)


@app.route('/api/list/endpoints')
def get_routes():
    """ Ruta que muestra la lista de rutas disponibles en la API """
    routes = [
        '/api/sql/boxeadores',
        '/api/sql/boxeadores/{id}',
        '/api/sql/estadios',
        '/api/sql/entrenadores',
        '/api/sql/categorias',
        '/signup',
        '/login',
        '/about'
    ]
    return jsonify(routes)


if __name__ == '__main__':
    app.run()
