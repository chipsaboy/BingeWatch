Rails.application.routes.draw do
  resources :actors
  post '/rate' => 'rater#create', :as => 'rate'
  resources :reviews
  resources :shows
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "users#welcome"
end
