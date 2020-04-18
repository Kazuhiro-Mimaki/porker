Rails.application.routes.draw do
  root 'porkers#new'
  resources :porkers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
