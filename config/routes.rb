Rails.application.routes.draw do
  root 'movies#index'

  resources :movies do
    resources :showtimes
  end

  # Allow nested ticket routes without plain /showtimes/:id, /showtimes, etc.
  resources :showtimes, only: [] do
    resources :orders, only: [:show, :create, :new]
    resources :tickets, only: [:show, :update]
  end

  resources :orders, only: :index
end
