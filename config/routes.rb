Rails.application.routes.draw do
  get    'users/new'
  get    'users/edit'
  get    'users/update'
  get    'users/destroy'
  root   'articles#index'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'
  get    'sessions/destroy'
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
