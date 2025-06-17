Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products do
    get :who_bought, on: :member
  end

  resources :carts do
    member do #define custom actions for individual instances of the resource
      patch :double_quantity  # This creates a route like /carts/:id/double_quantity; The PATCH method is used because you’re modifying the existing resource, which in this case is the Cart. We use PATCH because you're updating the quantities of items in the cart (not creating or destroying a cart).
    end
  end

  #resources :carts creates the standard RESTful routes for CartsController. 
  #member do defines a custom route for individual records of Cart. 
  #This is useful for operations like double_quantities, which modify a specific cart. 
  #patch :double_quantities defines a route that sends a PATCH request to 
  #/carts/:id/double_quantities, which is routed to the double_quantities action in the 
  #CartsController.
    
  # Define your application routes per the DSL in 
  # https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"
end
