class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario].permit(:nombre, :password, :password_confirmation))
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
    if usuario.nil?
      flash[:mensaje] = "El usuario no existe"
      render "login"
      return
    elsif not usuario.authenticate clave
      flash[:mensaje] = "La clave es incorrecta"
      render "login"
      return
    else
      flash[:mensaje] = "Bienvenido, " + nombre
      session[:login] = usuario.id
      redirect_to raiz_index_path
    end
  end

  def logout
    session[:login] = nil
    flash[:mensaje] = "Has cerrado sesion correctamente"
    redirect_to raiz_index_path
  end
end
