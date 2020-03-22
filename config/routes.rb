Rails.application.routes.draw do
  root 'orders#new'

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"

  resources :products
  resources :orders

  get 'confirmation' => 'pages#confirmation'

  get '*path' => 'orders#new'
end
