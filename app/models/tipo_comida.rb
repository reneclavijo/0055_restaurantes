# Los modelos van en singular por ser clases
class TipoComida < ApplicationRecord
    has_many :restaurantes # en plural

    validates(:tipo, presence: true)    # evita guardar datos vacíos en la BD según el campo de tipo
    validates(:tipo, uniqueness: true)  # evita que existan registros duplicados según el campo de tipo
end
