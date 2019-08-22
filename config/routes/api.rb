defaults format: :json do
  scope module: :api do
    resources :rush_orders, only: [:index, :create]
    resources :session,     only: [:create, :destroy]
    resources :bc_orders,   only: [:index]
    resources :charges,     only: [:index, :create, :update]
  end
end
