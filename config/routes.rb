Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "boards#index"
  resources :boards do
    collection do
      post :confirm
    end
  end
end
