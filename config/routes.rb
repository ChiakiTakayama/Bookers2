Rails.application.routes.draw do
root to: "homes#top"

devise_for :users
resources :books,only: [:new, :create, :edit, :update, :index, :show, :destroy]
resources :users,only: [:show, :edit, :update, :index]#13章で追加、:createも必要？
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get "/home/about" => "homes#about", as: "about"
end