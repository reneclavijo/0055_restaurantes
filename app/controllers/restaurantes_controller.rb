# Controladores son en plural
class RestaurantesController < ApplicationController

    # GET /restaurantes/nuevo
    def crear
        @restaurante = Restaurante.new
    end

    # POST /restaurantes
    def guardar
        
    end
end
