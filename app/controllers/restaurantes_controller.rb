# Controladores son en plural
class RestaurantesController < ApplicationController

    before_action :asignar_restaurante, only: [:editar, :mostrar, :actualizar, :eliminar]
    # GET /restaurantes
    def listar
        @restaurantes = Restaurante.all
    end

    # GET /restaurantes/nuevo
    def crear
        @restaurante    = Restaurante.new
        @tipos_comidas  = TipoComida.all 
    end

    # GET /restaurantes/editar
    def editar
        @tipos_comidas  = TipoComida.all 
    end

    # GET /restaurantes/:id
    def mostrar

    end

    # POST /restaurantes
    def guardar
        @restaurante = Restaurante.new(params_restaurante)
        if @restaurante.save
            redirect_to restaurantes_path
        else
            @tipos_comidas = TipoComida.all
            render :crear
        end
    end

    # GET /restaurantes/editar
    def actualizar
        @restaurante.nombre = params_restaurante[:nombre]
        @restaurante.tipo_comida_id = params_restaurante[:tipo_comida_id]
        if @restaurante.save
            redirect_to restaurantes_path
        else
            @tipos_comidas = TipoComida.all
            render :editar
        end
    end

    def eliminar
        @restaurante.destroy
        redirect_to restaurantes_path
    end

    private 

    def asignar_restaurante
        @restaurante = Restaurante.find(params[:id])
    end

    def params_restaurante
        datos_restaurantes = params.require(:restaurante).permit(:nombre, :tipo_comida_id)
    end
end
