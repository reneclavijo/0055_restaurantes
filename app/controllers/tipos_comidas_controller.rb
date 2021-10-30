# Los controladores son en "plural" y hacen referencia al modelo 
class TiposComidasController < ApplicationController

    before_action :asignar_tipo_comida, only: [:mostrar, :editar, :actualizar, :eliminar]

    # before_action :mostrar_mensaje_antes, only: [:listar]
    # after_action  :mostrar_mensaje_despues

    # GET /tipos_comidas
    def listar
        @todos_los_tipos = TipoComida.all.order(id: :asc)
        @titulo_link = "Registrar nuevo tipo de comida"
    end

    # GET /tipos_comidas/nuevo
    def crear
        @tipo_comida = TipoComida.new
    end

    # GET /tipos_comidas/:id
    def mostrar
        # vista para mostrar el detalle de un tipo de comida
        # por ejemplo, podríamos mostrar todos los restaruantes adjuntos
    end

    # GET /tipos_comidas/:id/editar
    def editar
        # mostrar el formulario con los datos de un registro para cambiarlos
    end

    # POST /tipos_comidas
    def guardar
        # guardar lo que llegue del formulario en la base de datos
        datos_tipo_comida = params.require(:tipo_comida).permit(:tipo) # REPETIDO 💔
        @tipo_comida = TipoComida.new(datos_tipo_comida)
        if @tipo_comida.save # pregunta por las valiciones, SI pasa todas, se guarda, SINO, agregar un hash de errores
            redirect_to tipos_comidas_path
        else
            render :crear # prestado una vista
        end        
    end

    def actualizar
        # encontrar el registro que quiero editar en la BD
        datos_tipo_comida = params.require(:tipo_comida).permit(:tipo) # REPETIDO 💔
        # actualizar los campos necesarios
        @tipo_comida.tipo = datos_tipo_comida[:tipo]
        # guardar los cambios en la base de datos
        @tipo_comida.save
        # redireccionar a la lista de todos los tipos de comida
        redirect_to tipos_comidas_path
    end

    # DELETE /tipos_comidas/:id
    def eliminar
        # pasos para eliminar un registro
        # 1. buscar el registro por ID
        # 2. Intentar eliminar el registro
        @tipo_comida.destroy
        redirect_to tipos_comidas_path
    end

    private # todos los métodos de aquí hacia abajo SON PRIVADOS 🔐

    def asignar_tipo_comida
        @tipo_comida = TipoComida.find(params[:id])
    end
    
    def mostrar_mensaje_antes
        puts "HOLA ANTES DEL ACTION 🚚"
    end

    def mostrar_mensaje_despues
        puts "HOLA DESPUÉS DEL ACTION 🖖"
    end
end