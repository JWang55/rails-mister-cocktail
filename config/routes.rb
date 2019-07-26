Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "cocktails", to:'cocktails#index'
  # get "cocktails/new", to:'cocktails#new'
  # post "cocktails", to:'cocktails#create'
  # get 'cocktails/:id', to:'cocktails#show'
  resources :cocktails, only: [:index, :show, :create, :new] do
    resources :doses, only: [:create, :new, :destroy]
  end
end
