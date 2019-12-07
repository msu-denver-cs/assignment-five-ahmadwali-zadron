Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  resources :parts
  resources :makes
  resources :cars do
    get :autocomplete_car_name, on: :collection
    collection do
      get 'search'
    end
  end
  root to: "cars#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
