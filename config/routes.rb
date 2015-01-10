
Rails.application.routes.draw do
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
    end
