SisBec::Application.routes.draw do
  # AdminZONE_controller (solo para users admin)
  get "adminzone/index"
  post "adminzone/index"
  put "adminzone/index"
  get "adminzone/userlist"
  post "adminzone/userlist"
  
  # Rutas para manejo de archivos en Students
  resources :students do
    get 'download', on: :collection
  end
  #match 'students/download' => 'student#download', as: 'download', via: :get
  
  
  #Otras rutas
  get "lunch_petitions/show"
  get "lunch_petitions/newPetition"
  resources :scholarships

  resources :scholarship_petitions

  resources :doc_files

  resources :families

  get "welcome/index"
  devise_for :users
  #resources :students

  #Rutas para el manejo de files ()Fer()
  
  get "file/upload_file"
  get "file/list_file"
  get "file/destroy_file"
  get "file/comment_file"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
