Rails.application.routes.draw do
  
  # Rutas Tipos Comidas
  get   'tipos_comidas', to: 'tipos_comidas#listar'
  get   'nuevo_tipo_comida', to: 'tipos_comidas#nuevo'

  post  'nuevo_tipo_comida', to: 'tipos_comidas#crear'
end
