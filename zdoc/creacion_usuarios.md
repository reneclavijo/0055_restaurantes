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