Rails.application.routes.draw do
  get    'users/new'
  get    'users/destroy'
  root   'articles#index'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'
  get    '/',           to: 'articles#index'
  get    'new_article', to: 'articles#new'
  post   'new_article', to: 'articles#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
