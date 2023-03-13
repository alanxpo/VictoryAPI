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

#Definición de ruta para obtener un boxeador específico
@app.route('/api/sql/boxeadores/<int:id>')
def get_boxeador(id):
    cursor = db.cursor()
    cursor.execute("SELECT * FROM boxeador WHERE id=%s", [id])
    data = cursor.fetchall()
    cursor.close()
    if len(data) == 0:
        return jsonify({'mensaje': 'No se encontro el boxeador solicitado'})
    boxeadores = []
    for row in data:
        boxeador = {'id': row[0], 'nombre': row[1], 'peso': row[2], 'altura': row[3], 'edad': row[4], 'record': row[5]}
        boxeadores.append(boxeador)
    return jsonify(boxeadores)

#Definición de ruta para obtener todos los boxeadores
@app.route('/api/sql/boxeadores')
def get_boxeadores():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM boxeador")
    data = cursor.fetchall()
    cursor.close()
    boxeadores = []
    for row in data:
        boxeador = {'id': row[0], 'nombre': row[1], 'peso': row[2], 'altura': row[3], 'edad': row[4], 'record': row[5]}
        boxeadores.append(boxeador)
    return jsonify(boxeadores)

#Ejecución de la aplicación
if __name__ == '__main__':
    app.run()