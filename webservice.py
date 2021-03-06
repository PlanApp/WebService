#
# 	WEBSERVER PLANAPP
# 	v.1.0
# 	05/09/2014
# 	leonardbravoillanes@gmail.com
#

import os
import functions
#!flask/bin/python
from flask import Flask
from flask import json
from flask import jsonify
from flask import request
from flask import Response

#DECORADOR HTML LIB
from datetime import timedelta
from flask import make_response, request, current_app
from functools import update_wrapper

#DECORADOR HTML
def crossdomain(origin=None, methods=None, headers=None,max_age=21600, attach_to_all=True,automatic_options=True):
    if methods is not None:
        methods = ', '.join(sorted(x.upper() for x in methods))
    if headers is not None and not isinstance(headers, basestring):
        headers = ', '.join(x.upper() for x in headers)
    if not isinstance(origin, basestring):
        origin = ', '.join(origin)
    if isinstance(max_age, timedelta):
        max_age = max_age.total_seconds()

    def get_methods():
        if methods is not None:
            return methods

        options_resp = current_app.make_default_options_response()
        return options_resp.headers['allow']

    def decorator(f):
        def wrapped_function(*args, **kwargs):
            if automatic_options and request.method == 'OPTIONS':
                resp = current_app.make_default_options_response()
            else:
                resp = make_response(f(*args, **kwargs))
            if not attach_to_all and request.method != 'OPTIONS':
                return resp

            h = resp.headers

            h['Access-Control-Allow-Origin'] = origin
            h['Access-Control-Allow-Methods'] = get_methods()
            h['Access-Control-Max-Age'] = str(max_age)
            if headers is not None:
                h['Access-Control-Allow-Headers'] = headers
            return resp

        f.provide_automatic_options = False
        return update_wrapper(wrapped_function, f)
    return decorator


app = Flask(__name__)

#INDEX
@app.route('/')
@app.route('/index')
def index():
	return "<br>PLANAPP WEBSERVER<br>======================<br><br>Hello, World!\n"


#TEST
@app.route('/test', methods=['GET'])
#@app.route('/test', methods=['POST'])
@crossdomain(origin='*')
def test():
	var = request.args['var']
	#var = request.form['var']
	print var
        data = {'var': str(var)}
        respuesta = json.dumps(data)
        return Response(respuesta, content_type='application/json')


#LOGIN
@app.route('/login', methods=['POST'])
#@app.route('/login', methods=['GET'])
@crossdomain(origin='*')
def signup():
	print "Login"
	user = "";
	passwd="";
	mail = request.form['mail']
	password = request.form['password']
	usuario = functions.Fusuario()
	id_usuario = usuario.login(mail,password)
	print "login:"+mail+" - "+password
	if (id_usuario !=0):
		data = {'id': str(id_usuario),'mail': str(mail), 'edo':'ok'} #USUARIO VALIDO
	else:
		data = {'id': str(0),'mail': str(mail), 'edo':'mal'} #USUARIO VALIDO
	respuesta = json.dumps(data)
	print respuesta
	return Response(respuesta, content_type='application/json')




#REGISTRO
@app.route('/registro', methods=['POST'])
@crossdomain(origin='*')
def registro():
	mail = request.form['mail']
	nombre = request.form['nombre']
	password = request.form['password']
	fecha_nacimiento = request.form['fecha_nacimiento']
	sexo = request.form['sexo']
	#INSERTA DATOS EN FUNCION
	usuario = functions.Fusuario()
	idx = usuario.getID(mail)
	print mail+"-"+nombre+"-"+password+"-"+fecha_nacimiento+"-"+sexo
	print "SACO ID:"
	print idx
	#SI ES UN VALOR
	if (idx <= 0):
		usuario.registrar(mail, nombre, password, fecha_nacimiento, sexo)
    		data = {'edo':'ok'}
	    	respuesta = json.dumps(data)
	#SI ES OTRO VALOR
	else:
	    	data = {'edo':'error'}
	    	respuesta = json.dumps(data)
	print respuesta
	return Response(respuesta, content_type='application/json')


#LOGIN
@app.route('/recomienda_panoramas', methods=['POST'])
#@app.route('/login', methods=['GET'])
@crossdomain(origin='*')
def recomendar_panoramas():
    print "Recomendador"
    user = "";
    passwd="";
    id_usuario = request.form['id']
    longitud = request.form['longitud']
    latitud = request.form['latitud']
    acompanante = request.form['acompanante']
    dinero = request.form['dinero']

    print "a recomendar:"+id_usuario+"-"+longitud+"-"+latitud+"-"+acompanante+"-"+dinero
#    data = {'estado':'error'}

    data=[
        {'id_1':'1','lugar_1':'Nombre Lugar 1','id_2':'2', 'lugar_2':'Nombre Lugar 2','id_3':'3', 'lugar_3':'Nombre Lugar 3','img':'http://icons.iconarchive.com/icons/pelfusion/long-shadow-media/512/Maps-Pin-Place-icon.png'},
        {'id_1':'1','lugar_1':'Nombre Lugar 1','id_2':'2', 'lugar_2':'Nombre Lugar 2','id_3':'3', 'lugar_3':'Nombre Lugar 3','img':'http://icons.iconarchive.com/icons/pelfusion/long-shadow-media/512/Maps-Pin-Place-icon.png'},
        {'id_1':'1','lugar_1':'Nombre Lugar 1','id_2':'2', 'lugar_2':'Nombre Lugar 2','id_3':'3', 'lugar_3':'Nombre Lugar 3','img':'http://icons.iconarchive.com/icons/pelfusion/long-shadow-media/512/Maps-Pin-Place-icon.png'}
    ]

    respuesta = json.dumps(data)
    print respuesta
    return Response(respuesta, content_type='application/json')


@app.route('/recomienda_lugares', methods=['POST'])
#@app.route('/login', methods=['GET'])
@crossdomain(origin='*')
def recomendar_lugares():
    print "Recomendador"
    user = "";
    passwd="";
    id1 = request.form['id1']#id_lugar
    id2 = request.form['id2']#id_lugar
    id3 = request.form['id3']#id_lugar

    print "lugares:"+id1+"-"+id2+"-"+id3

    data=[
        {'id':'1','img':'http://icons.iconarchive.com/icons/pelfusion/long-shadow-media/512/Maps-Pin-Place-icon.png', 'nombre':'Nombre Lugar 1', 'latitud':'-33', 'longitud':'44', 'descrip':'bla bla', 'tipo':'Tipo'},
        {'id':'2','img':'http://icons.iconarchive.com/icons/pelfusion/long-shadow-media/512/Maps-Pin-Place-icon.png', 'nombre':'Nombre Lugar 2', 'latitud':'-33', 'longitud':'44', 'descrip':'bla bla', 'tipo':'Tipo'},
        {'id':'3','img':'http://icons.iconarchive.com/icons/pelfusion/long-shadow-media/512/Maps-Pin-Place-icon.png', 'nombre':'Nombre Lugar 3', 'latitud':'-33', 'longitud':'44', 'descrip':'bla bla', 'tipo':'Tipo'}
    ]

    respuesta = json.dumps(data)
    print respuesta
    return Response(respuesta, content_type='application/json')


@app.route('/historico', methods=['POST'])
#@app.route('/login', methods=['GET'])
@crossdomain(origin='*')
def historico():
    print "Histotico"
    user = "";
    passwd="";

    id_user = request.form['id_usuario']#id_usuario
    id1 = request.form['id1']#id_lugar
    id2 = request.form['id2']#id_lugar
    id3 = request.form['id3']#id_lugar

    print id_user+" lugares:"+id1+"-"+id2+"-"+id3
    panorama = functions.Fpanoramas()
    panorama.saveHistorico(id_user, id1, id2, id3)
    data = {'edo':'ok'}

    respuesta = json.dumps(data)
    print respuesta
    return Response(respuesta, content_type='application/json')




if __name__ == '__main__':
	port = int(os.environ.get('PORT', 5000))
    	app.debug = True
  	app.run(host='0.0.0.0', port=port)
