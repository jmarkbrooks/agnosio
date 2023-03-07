Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show, :create, :update, :destroy]
      resources :orders, only: [:index, :show, :create, :update, :destroy]
      resources :items, only: [:index, :show, :create, :update, :destroy]
      post 'orders/:id/add_item', to: 'orders#add_item'
    end
  end
end
