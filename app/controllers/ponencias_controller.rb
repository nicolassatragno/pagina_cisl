class PonenciasController < ApplicationController
  def new
  end

  def create
    @ponencia = Ponencia.new(parametros)
    @ponencia.save

    redirect_to action: :show, id: @ponencia.id
  end

  def show
    @ponencia = Ponencia.find(params[:id])
  end

  private
    def parametros
      params.require(:ponencia).permit(:titulo, :expositor, :descripcion)
    end
end
