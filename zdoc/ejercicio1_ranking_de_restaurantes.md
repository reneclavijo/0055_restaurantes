# Módulo 8 - Rails

## Enunciado

Existe la posibilidad de desarrollar una aplicación para las personas que les gusta mucho puntuar restaurantes y platos. Para diferenciar de otras aplicaciones en el mercado el puntaje se realizará solo a través de "emociones": 🥳 😅 😪.
Los usuarios pueden votar por el restaurante y/o por el plato pero solo pueden hacerlo 1 vez.
Nosotros como dueños del emprendimiento deberíamos poder registrar restaurantes nuevos con su nombre, tema (qué comida sirven) y un menú de máximo 5 platos por restaurante, esto con el fin de que los restaurantes también puedan probar platos nuevos y forzarlos a elegir sus mejores platos.
Los usuarios deberían poder buscar el restaurante, votar por alguno y registrarse en la aplicación para más adelante poder ofrecerles invitaciones a restaurantes o promociones.

## Modelos

### Objetivo de la clase de hoy: Registrar restaurantes por consola y verlos en una lista

1. Crear el proyecto utilizando el comando

    ```bash
    # rails new <nombre_aplicación> -> crea una aplicación en rails
    # -d postgresql -> configura el proyecto con la gema pg
    # -T -> crea un proyecto sin archivos de prueba de Minitest (vamos a utilizar Rspec)
    sudo apt-get install libpq-dev # instalar bibliotecas necesarias para la gema de postgres
    rails new <nombre_aplicación> -d postgresql -T
    ```

2. Configurar el postgres

    ```yml
    host: 127.0.0.1
    port: 5433          # 5432
    username: postgres
    password: postgres  # es su propio password
    ```

3. Crear el modelo Tipos Comida (SINGULAR)

    ```bash
    # crear un modelo llamado TipoComida con un campo
    # tipo:string
    rails g model TipoComida tipo:string
    ```

4. Ejecutando la migración

    ```bash
    # realizar la creación y migración de la base de datos
    rails db:create     # crear la base de datos 1 vez
    rails db:migrate    # migrar lo que sea necesario
    ```

5. Abrir la consola de Rails

    ```bash
    # abrir la consola con
    rails c
    ```

6. Crear un registro en la base de datos con TipoComida

    ```ruby
    tipo_italiana = TipoComida.new(tipo: 'italiana')    # creamos un objeto TipoComida
    tipo_italiana.save                                      # guardamos en objeto en la BD
    ```

7. Agregar un controlador y una vista que permita ver los registros en la base de datos

    ```ruby
    # app/controllers/tipos_comidas_controller.rb
    class TiposComidasController < ApplicationController
        # GET /tipos_comidas
        def listar
            @todos_los_tipos = TipoComida.all.order(id: :asc)
            @titulo_link = "Registrar nuevo tipo de comida"
        end
    end
    ```

8. Agregar a la tabla de registros un botón utilizando la etiqueta <%= link_to %> para eliminar los registros de la base de datos

    ```html
    <h1>
        <i class="fas fa-fish"></i>
        Listar los tipos de restaurantes
    </h1>

    <%= link_to @titulo_link, nuevo_tipo_comida_path, class: 'btn btn-primary' %>

    <table class="table">
        <tr>
            <th>id</th>
            <th class="text-center">tipo</th>
            <th class="text-end">acciones</th>
        </tr>
        <% @todos_los_tipos.each do |tipo_comida| %>
            <tr>
                <td> <%= tipo_comida.id %> </td>
                <td class="text-center"> 
                    <%= link_to tipo_comida_path(tipo_comida) do %>
                        <i class="fas fa-fish"></i>
                        <%= tipo_comida.tipo %>
                    <% end %>
                </td>
                <td class="text-end">
                    <%= link_to tipo_comida_path(tipo_comida), class: 'btn btn-danger', method: :delete, data: { confirm: '¿Está seguro que quiere eliminar el registro?' } do %>
                        <i class="fas fa-eraser"></i>
                        Borrar
                    <% end %>
                    <%= link_to editar_tipo_comida_path(tipo_comida), class: 'btn btn-warning' do %>
                        <i class="fas fa-edit"></i>
                        Editar
                    <% end %>
                </td>
            </tr>
        <% end %>
    </table>
    ```

9. Crear una vista para definir un formulario utilizando un POST para crear un nuevo TipoComida

    ```html
    <h1>Formulario para crear un nuevo tipo de comida</h1>

    <%= render 'formulario', base_tipo_comida: @tipo_comida  %>

    <%= link_to 'Volver', tipos_comidas_path %>
    ```

10. Definir un método en el controlador para capturar los datos enviados y almacenarlos en la BD

    ```ruby
     # POST /tipos_comidas
    def guardar
        # guardar lo que llegue del formulario en la base de datos
        datos_tipo_comida = params.require(:tipo_comida).permit(:tipo)
        nuevo_tipo = TipoComida.new(datos_tipo_comida)
        nuevo_tipo.save

        redirect_to tipos_comidas_path
    end
    ```

11. Modificar el archivo de ruta con las convenciones

    ```ruby
    Rails.application.routes.draw do
  
    # Rutas Tipos Comidas
    get      'tipos_comidas',             to: 'tipos_comidas#listar',     as: 'tipos_comidas'     # listar 
    get      'tipos_comidas/nuevo',       to: 'tipos_comidas#crear',      as: 'nuevo_tipo_comida' # formulario de nuevo
    get      'tipos_comidas/:id',         to: 'tipos_comidas#mostrar',    as: 'tipo_comida'       # vista del detalle de un tipo de comida
    get      'tipos_comidas/:id/editar',  to: 'tipos_comidas#editar',     as: 'editar_tipo_comida'# formulario para editar el registro

    post     'tipos_comidas',             to: 'tipos_comidas#guardar'
    put      'tipos_comidas/:id',         to: 'tipos_comidas#actualizar'
    patch    'tipos_comidas/:id',         to: 'tipos_comidas#actualizar'
    delete   'tipos_comidas/:id',         to: 'tipos_comidas#eliminar'

    end
    ```
