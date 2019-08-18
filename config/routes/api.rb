defaults format: :json do
  scope module: :api do
    resources :rush_orders, only: [:index]
    resources :session,     only: [:create, :destroy]
    resources :bc_orders,   only: [:index]
  end
end