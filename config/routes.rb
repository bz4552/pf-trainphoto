Rails.application.routes.draw do
  get 'search/search'

  root to: 'homes#top'
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',  
  }

  devise_for :users, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }
  
  namespace :admin do
    resources :categories, only:[:index, :create, :new, :edit, :update]
  end
end
