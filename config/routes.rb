Rails.application.routes.draw do
  root 'travels#index'

  resources :travels do
    resources :schedules
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
