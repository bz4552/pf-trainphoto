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

  resources :posts, only: [:new, :create, :index, :show, :update, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy] 
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
end
