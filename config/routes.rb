Rails.application.routes.draw do

  get 'orders', to: 'orders#index', defaults: { format: 'json' }
  get 'orders/:order_id', to: 'orders#show', defaults: { format: 'json' }

    # resources :orders
    # get 'orders/index'
  # root 'orders#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
