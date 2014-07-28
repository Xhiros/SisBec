class LunchPetitionsController < ApplicationController
  def show
  end

  def newPetition
    @prueba = LuchPetition.consultar(params[:id])
  end
end
