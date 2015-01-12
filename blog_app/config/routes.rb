Rails.application.routes.draw do
  get 'blogs/index'

  root to: "blogs#index"

  get "/blogs", to: "blogs#index"

  get "/blogs/new", to: "blogs#new", as: "new_blog"

  post "/blogs", to: "blogs#create"

  get "/blogs/:id", to: "blogs#show", as: "blog"

  get "/blogs/:id/edit", to: "blogs#edit", as: "edit_blog"

  patch "/blogs/:id", to: "blogs#update"
   
  delete "/blogs/:id", to: "blogs#destroy"

end

# Del's steps to greatness
#1. Route 2. Controller 3. Method 4. View 5.Route