Copyright (C) Nicolás Satragno <nsatragno@gnome.org> 


Licencia GPL V3


Aplicación demo para la CISL 2013

/// Rapid Application Development con Ruby on Rails
/// Nicolás Satragno <nsatragno@gnome.org>
/// Repo github: https://github.com/nicolassatragno/pagina_cisl
///  En vivo en: http://cisl-isitfedoraruby.rhcloud.com

//Instalamos los archivos necesarios

$ su
# yum install rubygem-rails rubygem-json rubygem-mkrf ruby-devel gcc sqlite-devel nodejs

//Creamos la aplicación

$ rails new pagina_cisl
$ cd pagina_cisl

//Probamos que todo esté funcionando

$ rails server

//Generamos controlador raíz

$ rails generate controller raiz index

//Editamos config/routes.rb y agregamos

root "raiz#index"

//Inspeccionamos controllers/raiz_controller.rb y views/raiz

//Probamos nuevamente

//Descargamos algo de código

git checkout 01_controlador_index

//Recargamos la página

//Generamos modelo de ponencia

$ rails generate model Ponencia titulo:string expositor:string descripcion:text

$ rake db:migrate

//Agregar código a routes.rb

resources :ponencias

//Generamos controlador ponencias con acciones new y create

$ rails generate controller ponencias new create

//Traemos código nuevo del formulario

$ git checkout 02_creacion_ponencias

//Inspeccionamos código controllers/ponencia_controller.rb. Vemos vista.

$ git checkout 03_guardado_ponencias

//Inspeccionamos código nuevamente. Guardamos una ponencia, vemos el resultado.

//Agregamos validación

$ git checkout 04_validacion

//Inspeccionamos app/model/Ponencia y app/views/ponencia/new
//Pequeña explicación de l10n

//Agregamos listado en partial, explicación

$ git checkout 05_listado

//Se ve app/views/application/_ponencias.html.erb

//Mini explicación estilos

$ git checkout 06_estilo
