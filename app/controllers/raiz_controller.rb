class RaizController < ApplicationController
  def index
    @ponencias = Ponencia.all
  end
end
