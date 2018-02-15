Rails.application.routes.draw do

  get '/trails/api', to: "trails#trails_api"
    

  devise_for :users
  resources :trails, :lists, :tips, :questions, :answers
  resources :regions, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
