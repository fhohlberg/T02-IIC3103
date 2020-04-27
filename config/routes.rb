Rails.application.routes.draw do
  resources :hamburguesa_ingredientes
  #resources :hamburguesas do 
  #  resources :ingredientes
 # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hamburguesa', to: 'hamburguesas#index'
  get '/hamburguesa/:id', to: 'hamburguesas#show'
  post '/hamburguesa', to: 'hamburguesas#create'
  delete '/hamburguesa/:id', to: 'hamburguesas#destroy'
  patch '/hamburguesa/:id', to: 'hamburguesas#update'

  get '/ingrediente', to: 'ingredientes#index'
  get '/ingrediente/:id', to: 'ingredientes#show'
  post '/ingrediente', to: 'ingredientes#create'
  delete '/ingrediente/:id', to: 'ingredientes#destroy'

  put '/hamburguesa/:hamburguesa_id/ingrediente/:ingrediente_id', to: 'hamburguesa_ingredientes#agregar_ingredientes'
  delete '/hamburguesa/:hamburguesa_id/ingrediente/:ingrediente_id', to: 'hamburguesa_ingredientes#eliminar_ingredientes'
end
