Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Cheese
  get '/cheeses', to: 'cheeses#index'
  get '/cheeses/:id', to: 'cheeses#show'
  get '/cheeses/name/:name', to: 'cheeses#name'

  # Bird
  # get '/birds', to: 'birds#index'
  # get '/birds/:id', to: 'birds#show'
  resources :birds, only: [:index, :show]

end
