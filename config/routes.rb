Rails.application.routes.draw do

  root to: 'welcome#index'
  get '/questions/:id/next', to: "questions#next"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :trails, :tips
  resources :lists, only [:show, :new, :create, :edit, :update, :destroy]
  resources :regions, only: [:index, :show]
  resources :questions do
    resources :answers, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
