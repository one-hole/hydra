defaults format: :json do
  namespace :admin do
    resources :charges,     only: [:index, :create, :update]
    resources :users,       only: [:create, :update]
  end
end
