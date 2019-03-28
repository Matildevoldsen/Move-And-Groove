Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', 'sign_up': 'register', sign_out: 'logout'}

  get 'activities/index'
  root to: 'activities#index'

  resources :activities

  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
