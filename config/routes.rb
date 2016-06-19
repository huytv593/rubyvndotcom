Rails.application.routes.draw do

  resources :comments
  devise_for :users, controller: {
      session: 'users/session'
  }

  root 'pages#home'
  get 'about'     => 'pages#about'
  get 'contact'   => 'pages#contact'
  get 'posts/:id' => 'posts#show', as: :post
  get 'categories/:id' => 'categories#show', as: :category

  namespace :admin do
    resources   :users
    resources   :posts
    resources   :categories
  end

  scope :admin do
    root 'admin#dashboard', as: :admin
  end
end
