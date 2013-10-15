class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario].permit(:nombre, :password, :password_confirmation))
    @usuario.nivel = 1 #Establecemos el nivel inicial al básico
    if @usuario.save
      flash[:mensaje] = "El usuario se ha registrado exitosamente"
      redirect_to raiz_index_path
    else
      render "new"
    end
  end

  def login
    @usuario = Usuario.new
  end
  
  def login_post
    nombre = params[:usuario][:nombre]
    clave = params[:usuario][:password]
    usuario = Usuario.find_by nombre: nombre
    @usuario = Usuario.new :nombre => nombre, :password => clave
    if usuario.nil? || (!usuario.authenticate clave)
      flash.now[:mensaje] = "Los datos de login no son correctos"
      render "login"
      return
    else
      flash[:mensaje] = "Bienvenido, " + nombre
      session[:login] = usuario.id
      session[:nivel] = usuario.nivel
      redirect_to raiz_index_path
    end
  end

  def logout
    session[:login] = nil
    session[:nivel] = nil
    flash[:mensaje] = "Has cerrado sesion correctamente"
    redirect_to raiz_index_path
  end
end
