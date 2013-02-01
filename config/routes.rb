SecretsApp::Application.routes.draw do
  resource  :session, only: [:new, :create, :destroy]
  resources :secrets
  resources :users

  root to: 'sessions#new'
end
