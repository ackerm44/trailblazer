Rails.application.routes.draw do

  get '/questions/:id/next', to: "questions#next"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root 'welcome#show', as: :authenticated_root
  end

  root to: 'welcome#index'

  resources :trails, :tips
  resources :lists, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :regions, only: [:index, :show]
  resources :questions do
    resources :answers, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
