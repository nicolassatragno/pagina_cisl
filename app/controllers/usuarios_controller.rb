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
  end

  def logout
  end
end
