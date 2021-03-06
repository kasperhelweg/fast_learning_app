FastLearningApp::Application.routes.draw do
 
  root                            to: 'application_pages#show', :id => 1
  
  # Static pages
  match '/home',                  to: 'application_pages#show', :id => 1
  match '/about',                 to: 'application_pages#show', :id => 2
  # match '/calendar',              to: 'application_pages#show', :id => 3
  match '/terms',                 to: 'application_pages#show', :id => 3
  # match '/contact',               to: 'application_pages#show', :id => 5

  # Pages
  resources :pages
 
  # Application pages
  resources :application_pages

  # Users 
  devise_scope :user do
    match "/signin",  :to => "devise/sessions#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations" }
  
  
  resources :users
  match '/profile', to: 'users#show'
  
  # Roles
  resources :roles

  # Courses
  resources :courses  
  resources :classrooms, except: [:show] do
    match ':id(.:format)',  to: 'classrooms#show', as: :page, via: :get
  end

  # Assets
  resources :resources
  
  resources :enrollments
  
  # Orders
  resources :orders
  
  # Products
  resources :products
  
  # LearningPlans
  resources :learning_plans
  
  # Organisations
  resources :organizations, :path => '' do
    resources :users, :as => 'people',
    :only => [:new, :create],
    :path => 'people',
    :controller => 'organizations/people'
    
  end
  
  resources :learning_spaces, :only => [:index, :new, :create], :path => '/:organization_id/learningspaces/'
  resources :learning_spaces, :only => [:edit, :show, :update, :destroy], :path => '/:organization_id/' do
    resources :users, :as => 'people',
    :only => [:new, :create],
    :path => 'people',
    :controller => 'learning_spaces/people'
    match '/checkout', to: 'learning_spaces/checkout#edit', :via => :get
    match '/checkout', to: 'learning_spaces/checkout#update', :via => :put
    
    #resources :checkout  
  end

  # Errors routing
  match '*a', :to => 'errors#routing'


  #  resources :companies, :path => '', :only => [] do 
 # resources :companies, :path => '', :only => [], :shallow => true do 
   # resources :learners, :as => 'people', 
   #                      :only => [:new, :edit, :create, :update], 
   #                      :path => 'people', 
   #                      :path_names => { :edit => 'account',  :new => 'new' }, 
   #                      :controller=>'company/people' 

  #end


  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
