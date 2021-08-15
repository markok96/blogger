Rails.application.routes.draw do
  resources :authors
  root to: 'articles#index'
  resources :articles do
    resources :comments
    member do
      patch :archive
    end
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
