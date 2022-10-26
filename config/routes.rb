Rails.application.routes.draw do
  #This is the root class. The page that will open on application load
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show]
end
