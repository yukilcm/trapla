Rails.application.routes.draw do
  get 'travels/index'

  get 'travels/new'

  root 'travels#index'

  resources :travels



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
