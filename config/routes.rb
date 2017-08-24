Rails.application.routes.draw do
  resources :tags
  resources :reviews
  resources :shows
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root :to => "users#welcome"
end
