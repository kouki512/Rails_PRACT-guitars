Rails.application.routes.draw do
  devise_for :users
  get 'user/mypage' => 'users#show'
  resources :practices
  resources :users, :except => :show

  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
