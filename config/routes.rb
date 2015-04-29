Rails.application.routes.draw do
  resources :test, only: :none do
    get :check, on: :collection
  end
end
