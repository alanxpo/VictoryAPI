# VictoryAPI


Autores: Alan Cordova Viera, Alan Alfredo ulloa muro

<<<<<<< HEAD
Ultima actualización: 25/05/2023

# Contenido
=======
Ultima actualización: 2023/03/02

## Contenido
>>>>>>> a24912c74847e8f8ca2bb010113f1b1607082345
- Goals
- Non-Goals
- Background
- Overview
- Diseño Detallado
  - Solucion 1
    - Frontend
    - Backend
  - Solucion 2
    - Frontend
    - Backend
- Consideraciones
- Métricas

<<<<<<< HEAD
# Links
=======
## Links
>>>>>>> a24912c74847e8f8ca2bb010113f1b1607082345
- [github.com/keioupimpero](#)
- [github.com/alanmuro01](#)
- [python.org](#)

<<<<<<< HEAD
# Objetivo
El objetivo de la API de Boxeo es proporcionar una plataforma para acceder a información actualizada y precisa sobre boxeadores, peleas y campeonatos a nivel mundial. Esta API será una herramienta útil para aficionados, periodistas deportivos, casas de apuestas y organizadores de eventos que deseen obtener estadísticas y datos detallados sobre el mundo del boxeo.

# Goals
=======
## Objetivo
El objetivo de la API de Boxeo es proporcionar una plataforma para acceder a información actualizada y precisa sobre boxeadores, peleas y campeonatos a nivel mundial. Esta API será una herramienta útil para aficionados, periodistas deportivos, casas de apuestas y organizadores de eventos que deseen obtener estadísticas y datos detallados sobre el mundo del boxeo.

## Goals
>>>>>>> a24912c74847e8f8ca2bb010113f1b1607082345
 - Proporcionar acceso a información detallada sobre boxeadores, peleas y campeonatos a nivel mundial.
 - Ofrecer datos actualizados en tiempo real.
 - Facilitar la integración con otras aplicaciones y herramientas.
 - Ofrecer una interfaz intuitiva y fácil de usar.
<<<<<<< HEAD
# Non-Goals
 - No ofrecer información engañosa o imprecisa.
 - No tener una interfaz complicada que dificulte la comprensión de la información.

# Background
 La API de Boxeo se desarrolla para brindar una herramienta más completa y actualizada sobre el mundo del boxeo. Se busca cubrir la necesidad de contar con datos precisos sobre boxeadores, peleas y campeonatos a nivel mundial, con el fin de proporcionar información actualizada para aficionados, periodistas deportivos, casas de apuestas y organizadores de eventos.

# Overview
La API de Boxeo será una plataforma en línea que proporcionará información detallada y actualizada sobre boxeadores, peleas y campeonatos a nivel mundial. La API estará diseñada para ser fácil de usar y fácilmente integrable con otras aplicaciones y herramientas. Los datos se actualizarán constantemente para garantizar que los usuarios tengan acceso a la información más reciente.

# Diseño detallado
El diseño detallado de la API VictoryAPI se describe a continuación:

## Arquitectura de la API
La API está desarrollada utilizando el framework Flask, que es un framework ligero y flexible para construir aplicaciones web en Python. Flask proporciona un enfoque simple y directo para el desarrollo de API RESTful.

La arquitectura de la API sigue el estilo arquitectónico REST, lo que significa que los recursos se representan mediante URLs y se accede a ellos mediante métodos HTTP estándar.

La API utiliza una base de datos MySQL para almacenar los datos relacionados con los boxeadores, estadios, entrenadores y categorías. Se establece una conexión a la base de datos utilizando la biblioteca mysql-connector-python.

## Seguridad y Autenticación
La API utiliza autenticación basada en tokens JWT (JSON Web Token) para proteger los endpoints que requieren autenticación. Cuando un usuario inicia sesión correctamente, se genera un token de acceso JWT que se devuelve al cliente. El cliente debe incluir este token en el encabezado de autorización de las solicitudes posteriores a los endpoints protegidos.

El token JWT contiene información codificada, como el ID del usuario y la fecha de expiración. La API utiliza una clave secreta para firmar y verificar los tokens. El token se verifica en cada solicitud a los endpoints protegidos para asegurarse de que es válido y no ha expirado.

La API también utiliza la función hash SHA256 para cifrar las contraseñas de los usuarios almacenadas en la base de datos. Esto proporciona una capa adicional de seguridad para proteger las contraseñas en caso de que la base de datos sea comprometida.

## Base de Datos
La API utiliza una base de datos MySQL para almacenar los datos relacionados con los boxeadores, estadios, entrenadores y categorías. Se establece una conexión a la base de datos utilizando la biblioteca mysql.connector y se realizan consultas SQL para recuperar los datos solicitados.

La conexión a la base de datos se configura en el archivo app.py mediante los parámetros de conexión, que incluyen el nombre de usuario, la contraseña, la dirección del host, el nombre de la base de datos y el complemento de autenticación.

# Soluciones
La aplicación representa VictoryAPI, una API REST para el boxeo. 
Este código representa VictoryAPI, una API creada para manejar datos relacionados con el boxeo. La API requiere autenticación JWT y admite el registro de acceso a los endpoints.

La API cuenta con los siguientes endpoints y funcionalidades:

- /signup (POST): Permite a los usuarios registrarse en la API. Los usuarios proporcionan un nombre de usuario y una contraseña, que se almacenan en la base de datos después de ser cifrados utilizando la función hash SHA256. Se realiza una validación para evitar el registro de usuarios duplicados.

- /login (POST): Permite a los usuarios iniciar sesión en la API. Los usuarios proporcionan su nombre de usuario y contraseña, que se verifican en la base de datos. Si las credenciales son válidas, se genera un token de acceso JWT (JSON Web Token) que se utiliza para autenticar las solicitudes posteriores a los endpoints protegidos.

- /api/sql/boxeadores (GET): Recupera una lista de boxeadores de la base de datos. Se realiza una consulta a la base de datos para obtener los datos de los boxeadores, incluyendo su ID, nombre, peso, altura, edad, record y categoría. Los datos se devuelven en formato JSON.

- /api/sql/boxeadores/{id} (GET): Recupera un boxeador específico de la base de datos según su ID. Se realiza una consulta a la base de datos para obtener los datos del boxeador con el ID especificado. Los datos se devuelven en formato JSON.

- /api/sql/estadios (GET): Recupera una lista de estadios de boxeo de la base de datos. Se realiza una consulta a la base de datos para obtener los datos de los estadios, incluyendo su ID, nombre, ciudad, capacidad e inauguración. Los datos se devuelven en formato JSON.

- /api/sql/entrenadores (GET): Recupera una lista de entrenadores de boxeo de la base de datos. Se realiza una consulta a la base de datos para obtener los datos de los entrenadores, incluyendo su ID, nombre, edad, nacionalidad, experiencia y el ID del boxeador que entrenan. Los datos se devuelven en formato JSON.

- /api/sql/categorias (GET): Recupera una lista de categorías de boxeo de la base de datos. Se realiza una consulta a la base de datos para obtener los datos de las categorías, incluyendo su ID, nombre, peso mínimo y peso máximo. Los datos se devuelven en formato JSON.

- /about (GET): Devuelve información sobre la API en formato JSON. Los datos se leen desde un archivo JSON llamado victoryapi.json y se devuelven al cliente.

- /api/list/endpoints (GET): Devuelve una lista de todos los endpoints disponibles en la API, incluyendo su ruta y método HTTP permitido. Los datos se generan dinámicamente utilizando la biblioteca Flask.

# Consideraciones
=======
## Non-Goals
 - No ofrecer información engañosa o imprecisa.
 - No tener una interfaz complicada que dificulte la comprensión de la información.

## Background
 La API de Boxeo se desarrolla para brindar una herramienta más completa y actualizada sobre el mundo del boxeo. Se busca cubrir la necesidad de contar con datos precisos sobre boxeadores, peleas y campeonatos a nivel mundial, con el fin de proporcionar información actualizada para aficionados, periodistas deportivos, casas de apuestas y organizadores de eventos.

## Overview
La API de Boxeo será una plataforma en línea que proporcionará información detallada y actualizada sobre boxeadores, peleas y campeonatos a nivel mundial. La API estará diseñada para ser fácil de usar y fácilmente integrable con otras aplicaciones y herramientas. Los datos se actualizarán constantemente para garantizar que los usuarios tengan acceso a la información más reciente.

## Diseño detallado


## Solution 1
### Frontend
_Frontend…_
### Backend
_Backend…_

## Solution 2
### Frontend
_Frontend…_
### Backend
_Backend…_

## Consideraciones
>>>>>>> a24912c74847e8f8ca2bb010113f1b1607082345
 - La API debe ser fácil de usar.
 - La seguridad de los datos de los usuarios es una prioridad.
 - La API debe ser escalable y capaz de manejar grandes cantidades de tráfico.


<<<<<<< HEAD
# Métricas
=======
## Métricas
>>>>>>> a24912c74847e8f8ca2bb010113f1b1607082345
 -  Tiempo de respuesta: mide el tiempo que tarda la API en responder a las solicitudes de los usuarios.
 - Tasa de error: mide la cantidad de solicitudes que resultan en errores de la API.
 - Tasa de éxito: mide la cantidad de solicitudes que se completan con éxito.
 - Cantidad de solicitudes: mide la cantidad total de solicitudes que se realizan a la API.
<<<<<<< HEAD

# Requerimientos
 -  Python 3.10

# Instalación
Clona este repositorio en tu máquina local:

``git clone https://github.com/ITE-Ensenada/backend/tree/VictoryAPI``

Crea y activa un entorno virtual utilizando `venv` o `virtualenv`:

``python3 -m venv myenv``

``source myenv/bin/activate``

Asegúrate de estar en el directorio raíz del proyecto:

``cd victoryapi``

Instala las dependencias del proyecto utilizando pip y el archivo requirements.txt:

``pip install -r requirements.txt``

# Uso
## API
Ejecuta la aplicación:


``python app.py``

Abre un navegador web y visita http://localhost:5000 para acceder a la aplicación.

## Endpoints

Después de registrarse o iniciar sesión en la API, recibirás un token Bearer que te permitirá acceder a los endpoints protegidos. A continuación, te explico cómo utilizar este token con Postman para recibir la información del endpoint en formato JSON.

1. Abre Postman y crea una nueva solicitud para el endpoint al que deseas acceder. En este caso sera ``api/sql/boxeadores``.
2. En la sección de encabezados (Headers), agrega una nueva clave de encabezado llamada "Authorization" y asigna como valor "Bearer {token}". Reemplaza "{token}" con el token que recibiste al iniciar sesión.

Ejemplo:
>Key: Authorization

>Value: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjExMTEiLCJpYXQiOjE2MzE4NzY3NzUsImV4cCI6MTYzMTg3NzIzNX0.0Q1k3Hb9TFmiAXiJP71o9I3rt7lBdz06PXj3JYMfSwg

3. Haz clic en el botón "Send" para enviar la solicitud al servidor.

4. La API verificará el token en el encabezado de autorización y, si es válido, devolverá la información del endpoint solicitado en formato JSON.

5.- En la respuesta de Postman, podrás ver la información del endpoint en el cuerpo de la respuesta en formato JSON.

Ejemplo:
>{
        "altura": 1.91,
        "categoria": 1,
        "ciudad": "Louisville",
        "edad": 35,
        "entrenador": "Angelo Dundee",
        "id": 12,
        "nacionalidad": "United States",
        "nombre": "Muhammad Ali",
        "peso": 200.5,
        "record": "56-5"
    }
    
De esta manera, utilizando el encabezado de autorización con el valor del token Bearer en Postman, podrás acceder a los endpoints protegidos y recibir la información en formato JSON. Asegúrate de mantener el token de forma segura y no compartirlo con otros, ya que proporciona acceso a los recursos protegidos de la API.
=======
>>>>>>> a24912c74847e8f8ca2bb010113f1b1607082345
