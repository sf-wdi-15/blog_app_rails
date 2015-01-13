
Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

        root to: 'blogs#index'

        # Add prefixes to routes using `as: "some_prefix"` syntax
        get '/blogs', to: 'blogs#index', as: "blogs"

        get '/blogs/new', to: 'blogs#new', as: "new_blog"

        get '/blogs/:id', to: 'blogs#show', as: "blog"

        get '/blogs/:id/edit', to: 'blogs#edit', as: "edit_blog"        

        post "/blogs", to: "blogs#create"

        # The update route
        patch "/blogs/:id", to: "blogs#update"

        # the destroy route
        delete "/blogs/:id", to: "blogs#destroy"
 ######login#####
  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  get "/logout", to: "sessions#destroy", as: "logout"

  resources :users
      
    end
