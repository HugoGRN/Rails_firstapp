Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'

  get 'blog', to: 'articles#index'
  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  root "pages#home"

end
