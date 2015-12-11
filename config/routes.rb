Rails.application.routes.draw do
  root 'home#index'
  post '/development_rates/:id/edit' => 'development_rates#edit'
  post '/development_rates/:id' => 'development_rates#show'
  resources :topics
  resources :coinrates
  resources :exchanges
  resources :rate_registers
  resources :development_rates
  resources :rates

  resources :countries

  get '/articles/suggested/:id/authorize' => 'articles#authorize'
  get '/articles/suggested/:id/deauthorize' => 'articles#deauthorize'
  get '/articles/suggested' => 'articles#suggested'
  get '/about_us' => 'home#about_us'
  get '/denial' => 'home#denial'

  get '/contact_us' => 'home#contact_us'

  get '/users/show' => 'admin#show'
  get '/users/all'=>'admin#alluser'
  get '/show_user/:id' => 'admin#show_user'
  devise_for :users
  resources :ratetypes
  resources :comments
  resources :rateclasses


  resources :companies
  resources :articles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get '/new_article' => 'articles#new'
  get '/new_rate' => 'rateclasses#new_rate'
  get '/new_rate' => 'ratetypes#new_rate'
  get '/articles' => 'articles#index'
  get '/articles/:id/comments/new' => 'comments#new'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
