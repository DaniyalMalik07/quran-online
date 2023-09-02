# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'page#home'
  get 'page/contact'
  get 'page/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
