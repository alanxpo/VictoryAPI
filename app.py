from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

#Conexión a la base de datos
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="!Vvictory1",
    database="victoryapi"
)

@app.route('/xd')
def hello():
    return '¡Hola, mundo!'

#Definición de ruta para obtener un boxeador específico
@app.route('/api/sql/boxeadores/<int:id>')
def get_boxeador(id):
    cursor = db.cursor()
    cursor.execute("SELECT boxeador.id, boxeador.nombre, boxeador.apellido, boxeador.peso, boxeador.altura, boxeador.edad, boxeador.record, categoria.nombre as categoria FROM boxeador INNER JOIN categoria ON boxeador.categoria = categoria.id WHERE boxeador.id=%s", [id])
    data = cursor.fetchall()
    cursor.close()
    if len(data) == 0:
        return jsonify({'mensaje': 'No se encontro el boxeador solicitado'})
    boxeadores = []
    for row in data:
        boxeador = {'id': row[0], 'nombre': row[1]+" "+row[2], 'peso': row[3], 'altura': row[4], 'edad': row[5], 'record': row[6], 'categoria': row[7]}
        boxeadores.append(boxeador)
    return jsonify(boxeadores)

#Definición de ruta para obtener todos los boxeadores
@app.route('/api/sql/boxeadores')
def get_boxeadores():
    cursor = db.cursor()
    cursor.execute("SELECT boxeador.id, boxeador.nombre, boxeador.apellido, boxeador.peso, boxeador.altura, boxeador.edad, boxeador.record, categoria.nombre as categoria FROM boxeador INNER JOIN categoria ON boxeador.categoria = categoria.id")
    data = cursor.fetchall()
    cursor.close()
    boxeadores = []
    for row in data:
        boxeador = {'id': row[0], 'nombre': row[1]+" "+row[2], 'peso': row[3], 'altura': row[4], 'edad': row[5], 'record': row[6], 'categoria': row[7]}
        boxeadores.append(boxeador)
    return jsonify(boxeadores)


#Definición de ruta para obtener todos los estadios
@app.route('/api/sql/estadios')
def get_estadios():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM estadios_boxeo")
    data = cursor.fetchall()
    cursor.close()
    estadios = []
    for row in data:
        estadios_boxeo = {'id': row[0], 'nombre': row[1], 'ciudad': row[2], 'capacidad': row[3], 'inaugurado': row[4]}
        estadios.append(estadios_boxeo)
    return jsonify(estadios)

#Definición de ruta para obtener todos los entrenadores
@app.route('/api/sql/entrenadores')
def get_entrenadores():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM entrenadores")
    data = cursor.fetchall()
    cursor.close()
    entrenador = []
    for row in data:
        entrenadores = {'id': row[0], 'nombre': row[1], 'edad': row[2], 'nacionalidad': row[3], 'experiencia': row[4], 'idBoxeadorEntrenado': row[5]}
        entrenador.append(entrenadores)
    return jsonify(entrenador)

#Definición de ruta para obtener todas las categorias
@app.route('/api/sql/categorias')
def get_categorias():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM categoria")
    data = cursor.fetchall()
    cursor.close()
    categorias = []
    for row in data:
        categoria = {'id': row[0], 'nombre': row[1], 'pesoMinimo': row[2], 'pesoMaximo': row[3]}
        categorias.append(categoria)
    return jsonify(categorias)

#Ejecución de la aplicación
if __name__ == '__main__':
    app.run()
