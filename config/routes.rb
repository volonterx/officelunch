# -*- encoding : utf-8 -*-
Officelunch::Application.routes.draw do

  devise_for :users

  resources :dashboard, only: :index
  resources :course_categories
  resources :courses

  root :to => "dashboard#index"

end
