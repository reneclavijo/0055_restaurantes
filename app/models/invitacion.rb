class Invitacion < ApplicationRecord
  belongs_to :usuario
  belongs_to :restaurante
end
