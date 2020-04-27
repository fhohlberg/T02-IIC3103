# README

Tarea 02 - IIC 3103 #Francisca Hohlberg

La dirección de la aplicación montada en Heroku es https://tarea2-fh-iic3103.herokuapp.com/

Consideraciones:
- Las descripciones de status, en caso de error se muestran en body en formato JSON.
- Para hacer POST de hamburguesas se deben entregar todos los atrinutos (especificados en la documentación)
- Al hacer PUT o DELETE de hamburguesa/id/ingrediente/id, se da prioridad al error de hamburguesa, es decir, si no existe hamburguesa o el id de hamburguesa es invalido y además el id de ingrediente es inválido, el error que se mostrará en body será 404: Id de hamburguesa inválido.
- Si no hay elementos al hacer GET ../hamburguesa o ../ingrediente se mostrará un JSON con atributo "data" = [].

© 2020 GitHub, Inc.
