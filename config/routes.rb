Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin/operator', as: 'rails_admin'
  devise_for :admin,skip: [:registrations, :passwords] ,controllers:{
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords],controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  get 'user/mypage' => 'users#show'
  resources :practices
  resources :users, :except => :show
  resources :post_movies
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
