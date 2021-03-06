defaults format: :json do
  scope module: :api do
    resources :rush_orders, only: [:index, :create, :update]
    resources :session,     only: [:create, :destroy]
    resources :bc_orders,   only: [:index]
    resources :charges,     only: [:index, :create, :update]
    resource :profile,      only: [:show, :update]
  end
end
