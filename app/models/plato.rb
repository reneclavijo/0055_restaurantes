class Plato < ApplicationRecord
  belongs_to :restaurante

  has_many :puntajes_platos
  has_many :puntajes, through: :puntajes_platos

  
  validates(:nombre, presence: true)
  validates(:descripcion, presence: true)
  validates(:restaurante_id, presence: true)
  
end
