defaults format: :json do
  namespace :admin do
    resources :charges,     only: [:index, :create, :update]
  end
end
