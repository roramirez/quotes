Rails.application.routes.draw do
  resources :credit_requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/simulation', to: 'simulation#index'
  get '/new_subscriber', to: 'subscriber#new'
  
  get '/last', to: 'credit_requests#last'


  root 'credit_requests#index'
end
