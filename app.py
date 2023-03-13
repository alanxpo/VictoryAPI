from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    return "Hola Mundo"

@app.route("/bye")
def adios():
    return "bye bye bye"