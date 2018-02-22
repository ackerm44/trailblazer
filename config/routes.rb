Rails.application.routes.draw do

  root to: 'welcome#index'
  get '/questions/:id/next', to: "questions#next"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  resources :trails, :lists, :tips
  resources :regions, only: [:index, :show]
  resources :questions do
    resources :answers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
