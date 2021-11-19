Rails.application.routes.draw do

  resources :users do 
    resources :subs, only: [:edit]
  end
  resources :subs
  resources :posts, only: [:new, :create, :edit, :update, :destroym :show]
  resource :session, only: [:new, :create, :destroy]

end
