SecretsApp::Application.routes.draw do
  resource  :session, only: [:new, :create, :destroy]
  resources :secrets
  resources :users do
    get "reset_pwd" => 'users#reset_pwd', on: :collection
    post "reset_pwd" => 'users#reset_pwd_for_user', on: :collection
  end

  root to: 'sessions#new'
end
