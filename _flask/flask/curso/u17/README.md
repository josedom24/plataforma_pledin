---
title: "Plantillas con bootstrap (flask-bootstrap)"
permalink: /cursos/flask/curso/u17/index.html
---

Podemos utilizar la hoja de estilo que queramos, la podemos guardar en nuestro contenido estático o acceder por medio de una url.

Sin embargo si queremos trabajar con plantillas que utilicen como hoja de estilos y javascript el framework bootstrap podemos utilizar la extensión Flask-Bootstrap.

## Instalación de Flask-Bootstrap

Con nuestro entorno virtual activado:

	pip install Flask-Bootstrap

## Configuración de nuestra aplicación

En nuestra aplicación escribimos lo siguiente:

	from flask import Flask, render_template, abort
	from flask_bootstrap import Bootstrap
	app = Flask(__name__)
	Bootstrap(app)
	...

Está líneas generan una plantilla base de la que podemos extender las nuestras.

## Uso de la plantilla base bootstrap

Por ejemplo nuestra primera plantilla quedaría:
{%raw%}
	{% extends "bootstrap/base.html" %}
	{% block title %}Hola, que tal {{nombre}}{% endblock %}
	{% block content %}
	    <h2>Vamos a saludar</h2>
	    {% if nombre %}
	      <h1>Hola {{nombre|title}}</h1>
	      <p>¿Cómo estás?</p>
	    {%else%}
	      <p>No has indicado un nombre</p>
	    {% endif %}
	{% endblock %}
{%endraw%}
La plantilla base de bootstrap ofrece los siguientes bloques que podemos sobreescribir:

* `html`: Contiene el contenido completo de la etiqueta `<html>`.
* `html_attribs`: Atribulos para la etiqueta `<html>`.
* `head`: Contiene el contenido completo de la etiqueta `<head>`.
* `body`: Contiene el contenido completo de la etiqueta `<body>`.
* `body_attribs`: Atribulos para la etiqueta `<body>`.
* `title`: Contiene el contenido completo de la etiqueta `<title>`.
* `styles`: Contiene todos los estilos CSS de la etiqueta `<link>`.
* `metas`: Contiene los `<meta>` de la cabacera.
* `navbar`: Un bloque vacío encima del contenido.
* `content`: Bloque para poner nuestro contenido.
* `scripts`: Contiene todos los scripts en la etiqueta `<script>` al final del body.

## Ejemplos

Añadiendo otro fichero de hoja de estilo:
{%raw%}
    {% block styles %}
    {{super()}}
    <link rel="stylesheet" href="{{url_for('.static', filename='mystyle.css')}}">
    {% endblock %}
{%endraw%}
Añadiendo otro fichero Javascript:
{%raw%}
    {% block scripts %}
    <script src="{{url_for('.static', filename='myscripts.js')}}"></script>
    {{super()}}
    {% endblock %}
{%endraw%}
Añadiendo el idioma español en los atributos de `<html>`:
{%raw%}
    {% block html_attribs %} lang="es"{% endblock %}
{%endraw%}
## Código ejemplo de esta unidad

[Código](https://github.com/josedom24/curso_flask/tree/master/ejemplos/u17)