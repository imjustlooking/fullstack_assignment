Rails.application.routes.draw do

  get 'orders', to: 'orders#all', defaults: { format: 'json' }
  get 'orders/:order_id', to: 'orders#show', defaults: { format: 'json' }
  get 'orders/:order_id/feedbacks', to: 'orders#feedback'
  post 'orders/:order_id/feedbacks', to: 'orders#add'
    # resources :orders
    # get 'orders/index'
  root 'orders#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
