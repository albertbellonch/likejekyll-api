Rails.application.routes.draw do
  resources :pages, only: :show do
    resources :likes, only: :create
  end
end
