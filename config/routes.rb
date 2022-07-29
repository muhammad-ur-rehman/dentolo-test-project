Rails.application.routes.draw do
  root 'events#index' 
  resources :events, only: [:index] do
    get :refresh, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
