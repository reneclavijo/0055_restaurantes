class TiposComidasController < ApplicationController

    # GET /tipos_comidas
    def listar
        @todos_los_tipos = TipoComida.all
    end

    # GET /nuevo_tipo_comida
    def nuevo

    end
end