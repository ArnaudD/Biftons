Biftons::Application.routes.draw do

  resources :transactions

  devise_for :users

  root :to => 'home#index'

end
