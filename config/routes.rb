Rails.application.routes.draw do
  resources :events, only: [:index] do
    get :refresh, on: :collection
  end
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
