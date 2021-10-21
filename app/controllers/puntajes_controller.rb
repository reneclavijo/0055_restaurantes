class PuntajesController < ApplicationController

    # GET /puntajes
    def listar
        @todos_los_puntajes = Puntaje.all
    end

    # GET /puntajes/nuevo
    def crear
        @puntaje = Puntaje.new
    end

    # GET /puntajes/:id
    def mostrar
        @puntaje = Puntaje.find(params[:id])
    end

    # GET /puntajes/:id/editar
    def editar
        @puntaje = Puntaje.find(params[:id])
    end

    # POST /puntajes
    def guardar
        datos_puntaje = params.require(:puntaje).permit(:tipo)
        nuevo_puntaje = Puntaje.new(datos_puntaje)
        nuevo_puntaje.save
        
        redirect_to puntajes_path
    end

    # PUT   /puntajes/:id
    # PATCH /puntajes/:id
    def actualizar
        @puntaje = Puntaje.find(params[:id])
        datos_puntaje = params.require(:puntaje).permit(:tipo)
        @puntaje.tipo = datos_puntaje[:tipo]
        @puntaje.save
        redirect_to puntajes_path
    end

    # DELETE /puntajes/:id    
    def eliminar
        puntaje = Puntaje.find(params[:id])
        puntaje.destroy
        redirect_to puntajes_path
    end

end