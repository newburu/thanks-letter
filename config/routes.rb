Rails.application.routes.draw do
  resources :letter_images
  resources :letters

  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }

  # 静的ページ
  get "static_pages/terms"
  get "static_pages/privacy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "letters#index"
end
