Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  devise_for :users, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }

  root to: 'homes#top'
  get "about" => "homes#about"

  resources :posts, only: [:new, :create, :index, :show, :update, :search, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]

  namespace :admin do
    resources :categories, only:[:index, :create, :new, :edit, :update]
  end

end
