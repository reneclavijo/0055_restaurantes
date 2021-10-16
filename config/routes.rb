Rails.application.routes.draw do
  
  # Rutas Tipos Comidas
  get   'tipos_comidas', to: 'tipos_comidas#listar',    as: 'listar_tipos_comida'
  get   'nuevo_tipo_comida', to: 'tipos_comidas#nuevo', as: 'nuevo_tipo_comida'

  post  'nuevo_tipo_comida', to: 'tipos_comidas#crear'
end
