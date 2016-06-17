Rails.application.routes.draw do

  resources :categories
  devise_for :users, controller: {
      session: 'users/session'
  }

  root 'pages#home'
  get 'about'     => 'pages#about'
  get 'contact'   => 'pages#contact'
  get 'posts/:id' => 'posts#show', as: :post

  namespace :admin do
    resources   :users
    resources   :posts
  end

  scope :admin do
    root 'admin#dashboard', as: :admin
  end
end
