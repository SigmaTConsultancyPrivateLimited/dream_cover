Rails.application.routes.draw do
  resources :users


  # root to: 'pages#home'

  root 'pages#index'
  get 'about', to: 'pages#about'

end
