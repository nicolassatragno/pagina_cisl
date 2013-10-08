class PonenciasController < ApplicationController
  def new
    if @ponencia == nil then
      @ponencia = Ponencia.new
    end
  end

  def create
    @ponencia = Ponencia.new(parametros)
    if @ponencia.save
      redirect_to action: :show, id: @ponencia.id
    else
      render 'new'
    end
  end

  def show
    @ponencia = Ponencia.find(params[:id])
  end
  
  def destroy
    ponencia = Ponencia.find(params[:id])

    if ponencia.destroy  
      flash[:mensaje] = "La ponencia " + ponencia.titulo + " se ha borrado"
    else
      flash[:mensaje] = "No se pudo borrar la ponencia"
    end
      
    redirect_to raiz_index_path
  end

  private
    def parametros
      params.require(:ponencia).permit(:titulo, :expositor, :descripcion)
    end
end
