Rails.application.routes.draw do

  resources :users, shallow: true do
    member do
      resources :galleries do
        member do
          resources :photos
        end
      end
    end
  end

  root 'users#index'

  get "/login" => 'sessions#new', as: :login
  post "/login" => 'sessions#create'
  delete "/logout" => 'sessions#destroy', as: :logout
  # get "//galleries/:gallery_id/photos/:id"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
