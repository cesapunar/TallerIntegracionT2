Rails.application.routes.draw do

	resources :usuario

	put '/usuario' => 'usuario#create'

	post '/usuario/:id' => 'usuario#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
