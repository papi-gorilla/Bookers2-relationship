Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about"
  resources :books, only:[:index, :create, :show, :edit, :update, :destroy]
  resources :users do
    member do
      get :following, :follower
    end
  end
  resources :users, only:[:index, :show, :edit, :update]
  post "follow/:id" => "relationships#create", as: "follow"
  delete "unfollow/:id" => "relationships#destroy", as: "unfollow"

end
