Rails.application.routes.draw do
  resources :drugs
  resources :meds
  devise_for :admins
  resources :appointments
  devise_for :users
  #devise_for :users
  get 'home/index'
  #get 'home/aboutus'
  #get '/doctors_list' =>'doctors#doctors_list'
  get '/aboutus' => 'home#aboutus'
  get '/users' => 'users#index'

  resources :doctors do
  resources:appointments
end

  resources :patients do
    resources:appointments
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
   
  controller :patients do
  get 'patients/show'     => :show
  get 'patients/delete'   => :new
  get 'patients/edit/:id' => :edit
  get 'patients/delete'   => :index
  post 'patients/show'     => :show
  post 'patients/delete'   => :new
  post 'patients/edit/:id' => :edit
  post 'patients/delete'   => :index
end

controller :users do
  get 'users'     => :show
  get 'users/delete'   => :new
  get 'users/edit/:id' => :edit
  get 'users/delete'   => :index
  get 'users/edit'=> :edit
   put 'users/edit'=> :edit
  post 'users/show'     => :show
  post 'users/delete'   => :new
  post 'users/edit/:id' => :edit
  post 'users/delete'   => :index
  get 'profile' => :show
end

controller :doctors do
  get 'doctors/show'     => :show
  get 'doctors/delete'   => :new
  get 'doctors/edit/:id' => :edit
  get 'doctors/delete'   => :index
  post 'doctors/show'     => :show
  post 'doctors/delete'   => :new
  post 'doctors/edit/:id' => :edit
  post 'doctors/delete'   => :index
  get 'doctors_list' => :doctors_list
  
end
controller :appointments do
  get 'appointments/show'     => :show
 # get 'doctor/:doctor_id/appointments/:id'=> :show
  get 'appointments/delete'   => :new
  get 'appointments/edit/:id' => :edit
  get 'appointments/delete'   => :index
  post 'appointments/show'     => :show
  post 'appointments/delete'   => :new
  post 'appointments/edit/:id' => :edit
  post 'appointments/delete'   => :index
end

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
