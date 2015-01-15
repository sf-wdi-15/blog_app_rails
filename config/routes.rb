Rails.application.routes.draw do

  # get 'sessions/new'

  # get 'users/index'

  # get 'users/show'

  # get 'users/new'

  # get 'users/edit'

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :users

  # recources :passwords

  get 'passwords/new', to: "passwords#new", as: "new_password"

  post "/passwords", to: "passwords#create"

  post "/passwords/:id", to: "passwords#update"


  get "articles/index"

  root to: "articles#index"

  get "/articles", to: "articles#index", as: "articles"

  get "/articles/new", to: "articles#new", as: "new_article"

  get "/articles/about", to: "articles#about", as: "about"

  get "/articles/contact", to: "articles#contact", as: "contact"

  post "/articles", to: "articles#create"

  get "/articles/:id", to: "articles#show", as: "article"

  get "/articles/:id/edit", to: "articles#edit", as: "edit_article"

  patch "/articles/:id", to: "articles#update"

  patch "/articles/:id/edit", to: "articles#update"

  delete "/articles/:id", to: "articles#destroy"
end
