# Enunciado

## Terminar de ingresar o crear los modelos al proyecto de rails

1. Generando el modelo de Restaurante que se relaciona con TipoComida

    ```bash
    rails g model Restaurante nombre:string tipo_comida:references
    ```

2. Revisar el archivo de *inflections.rb* con las referencias a singular y plural

    ```ruby
    # inflections.rb
    ActiveSupport::Inflector.inflections(:en) do |inflect|
    #   inflect.plural /^(ox)$/i, '\1en'
    #   inflect.singular /^(ox)en/i, '\1'
    #   inflect.irregular 'person', 'people'
    #   inflect.uncountable %w( fish sheep )
        inflect.irregular 'tipo_comida', 'tipos_comidas'
    end
    ```

3. Ejecutar la migración


    ```bash
    rails db:migrate # migrar la tabla de restaurantes
    ```

4. Relacionar los modelos *Restaurante.rb* y *TipoComida*

5. Ejecutar la creación del modelo Plato

6. Ejecutar migración

7. Crear el modelo de Invitación

    ```bash
    rails g model Invitacion mensaje:string fecha:date usuario:references restaurante:references
    ```
