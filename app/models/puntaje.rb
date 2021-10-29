# Modelo va en singular
class Puntaje < ApplicationRecord

    before_validation :capitalizar

    has_many :puntajes_platos
    has_many :puntajes_restaurantes

    
    validates(:tipo, presence: true)
    validates(:tipo, uniqueness: true)

    private
    def capitalizar
        self.tipo.capitalize!
    end
end
