# Controladores son en plural
class RestaurantesController < ApplicationController

    # GET /restaurantes/nuevo
    def crear
        @restaurante    = Restaurante.new
        @tipos_comidas  = TipoComida.all 
    end

    # POST /restaurantes
    def guardar
        datos_restaurantes = params.require(:restaurante)
        .permit(:nombre, :tipo_comida_id)
        @restaurante = Restaurante.new(datos_restaurantes)
        if @restaurante.save
            redirect_to restaurantes_path #TODO: crear la ruta de todos los resturantes
        else
            @tipos_comidas = TipoComida.all
            render :crear
        end
    end
end
