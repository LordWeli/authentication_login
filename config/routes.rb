Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'logins#new'
  
  resources :logins, only: %i[new create destroy]
  resources :authentications, only: %i[new create]
  resources :home, only: %i[index]
end
