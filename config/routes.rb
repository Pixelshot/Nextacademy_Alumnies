Rails.application.routes.draw do

root "statics#index"

# resources :users, only: [:edit]
get '/login', to: "sessions#new", as: "login"
post '/login', to: "sessions#create"
delete '/logout', to: "sessions#destroy", as: "logout"

resources :users, only: [:index, :show, :edit, :update]
resources :sessions, only: [:new]
resources :newstables, only: [:index, :new, :show, :edit, :destroy]
post '/newstables/new', to: "newstables#create"
post "/newstables/:id/edit", to: 'newstables#update'

get '/admin', to: "admin#index"
get '/admin/:id/reset', to: "admin#reset", as: "user_reset"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources 

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
