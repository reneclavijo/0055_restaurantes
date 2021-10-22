# Crear CRUD para registrar usuarios en la app

1. Crear el modelo

    ```bash
    rails g model Usuario nombre_usuario:string password_digest:string
    ```

2. Ejecutar la migración

    ```bash
    rails db:migrate
    ```

3. Quitar el comentario de la gema de bcrypt en Gemfile

    ```ruby
    # Use Active Model has_secure_password
    gem 'bcrypt', '~> 3.1.7'
    ```

4. Ejecutar el comando bundle en consola

    ```bash
    bundle
    ```

5. Configurar el modelo para utilizar la gema bcrypt

    ```ruby
    # usuario.rb
    # Los modelos son en singular
    class Usuario < ApplicationRecord
        has_secure_password
        
    end
    ```

6. Agregar las validaciones al modelo del usuario

    ```ruby
    # usuario.rb
    # Los modelos son en singular
    class Usuario < ApplicationRecord
        has_secure_password

        validates(:nombre_usuario, presence: true)
        validates(:nombre_usuario, uniqueness: true)
        
    end
    ```

7. Crear el archivo de controlador

    ```ruby
    # app/controllers/usuarios_controller.rb
    # Los controladores son el plural
    class UsuariosController < ApplicationController
        
    end
    ```

8. Crear el método y la vista para el método

    ```ruby
    # Los controladores son el plural
    class UsuariosController < ApplicationController
        
        # GET /usuarios/nuevo
        def crear
        end
    end
    ```

9. Crear el archivo `app/views/usuarios/crear.html.erb`

10. Crear la ruta GET para la vista de crear un usuario

    ```ruby
    # config/routes.rb
    # Usuarios

    get       'usuarios/nuevo',           to: 'usuarios#crear',         as: 'nuevo_usuario'
    ```

11. Crear el formulario en el archivo `app/views/usuarios/crear.html.erb`

    ```html
    <h1>Registro</h1>

    <%= form_with(model: @usuario) do |formulario| %>
        <div class="mb-3">
            <%= formulario.label      :nombre_usuario, class: 'form-label'%>
            <%= formulario.text_field :nombre_usuario, class: 'form-control' %>
        </div>
        
        <div class="mb-3">
            <%= formulario.label          :password, class: 'form-label' %>
            <%= formulario.password_field :password, class: 'form-control' %>
        </div>
        
        <div class="mb-3">
            <%= formulario.label          :password_confirmation, class: 'form-label' %>
            <%= formulario.password_field :password_confirmation, class: 'form-control' %>
        </div>


        <%= formulario.submit %>
    <% end %>
    ```

12. Agregar la ruta del post (momentánea)

    ```ruby
    # Usuarios

    get       'usuarios/nuevo',           to: 'usuarios#crear',         as: 'nuevo_usuario'
    post      'usuarios',                 to: 'usuarios#guardar',       as: 'usuarios'
    ```

13. Crear la variable `@usuario` en el controlador

    ```ruby
    # Los controladores son el plural
    class UsuariosController < ApplicationController
        
        # GET /usuarios/nuevo
        def crear
            @usuario = Usuario.new
        end
    end
    ```
