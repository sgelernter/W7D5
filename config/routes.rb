Rails.application.routes.draw do

  resources :users do 
    resources :subs, only: [:edit]
  end
  resources :subs 
  resource :session, only: [:new, :create, :destroy]


end
