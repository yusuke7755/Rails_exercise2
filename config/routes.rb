Rails.application.routes.draw do
  resources :contacts do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
end
