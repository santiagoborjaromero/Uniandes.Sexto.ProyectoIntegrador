
![6UG8](logo6UG8.jpg)
# Bot 6UG8

**UNIVERSIDAD REGIONAL AUTÓNOMA DE LOS ANDES 
“UNIANDES”** <br>
>FACULTAD DE SISTEMAS MERCANTILES <br>
CARRERA DE INGENIERÍA DE SOFTWARE <br>
SEXTO SEMESTRE <br>
MODALIDAD: ON LINE

## Integrantes
>Hugo Alfredo Herrera Villalva <br>
Jaime Santiago Borja Romero <br>
Jorge Luis López Romo <br>
Joel Darío Brito Parra <br>
Ricardo Josué Vaca Miño <br>

## Recursos utilizados

- Python 3.12
- Telegram Bot
- MySql
- Agente Inteligente: Gemini 


Creacion del entorno virtual 
```
python -m venv venv
.\venv\Script\activate
python.exe -m pip install --upgrade pip   
pip install -r requirements.txt
```

###  Cómo obtener un respaldo de librerias?
```js
pip freeze > requirements.txt
```
### Cómo instalar librerias desde archivo requirements.txt
```js
pip install -r requirements.txt
```

Para mantener actualizado el repositorio, de los cambios que se vaya subiendo
```js
git pull origin master
```


Descripcion de archivos
```py
#Archivo de inicio
index.py

# Configuracion de telegram token, gemini, base de datos
config/init.py 

#Conexion con base de datos y consultas
src/controller.py

#Funciones varias
src/utils.py

#Puente de comunicacion entre index y controller
src/bridgecontroller.py

#Red neuronal
src/redneuronale.py 

#Repositorio de archivos temporales construidos en el reporte
temp/

```

Como plus adicional

```js
El archivo `pregunta.py` es un aplicativo de como funciona un chat inteligente de gemini, pueden hgacer preguntas.

El ingreso es de una sola linea consecutiva sin retornos de carro (enters).

Es alaja para preguntar cosas cotidianas, tal y como el chatgpt

En algun momento se le puede añadir a otro bot y tenemos un aistente inteligente.
```

