# Controladores son en plural
class RestaurantesController < ApplicationController

    # GET /restaurantes/nuevo
    def crear
        @restaurante = Restaurante.new
    end
end
