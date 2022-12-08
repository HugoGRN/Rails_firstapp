Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :articles

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'blog', to: 'articles#index'
  
  root "pages#home"

end
