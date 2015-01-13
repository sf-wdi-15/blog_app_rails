Rails.application.routes.draw do
  root to: 'articles#index'

  get '/articles', to: 'articles#index', as: 'articles'
  get '/articles/new', to: 'articles#new'
  get '/articles/:id', to: 'articles#show'
  get '/articles/:id/edit', to: 'articles#edit'
  post '/articles', to: 'articles#create'
  patch '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
end