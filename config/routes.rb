ActionController::Routing::Routes.draw do |map|
  
  # STI
  map.resources :services, :employment_opportunities, :users, :research_studies
  
  # Static pages
  map.with_options :controller => 'pages' do |page|
    page.about_us 'about_us', :action => 'about_us'
    page.patients 'patients', :action => 'patients'
    page.patient_satisfaction 'patient_satisfaction', :action => 'patient_satisfaction'
    page.patient_privacy 'patient_privacy', :action => 'patient_privacy'
    page.contact_us 'contact_us', :action => 'contact_us'
    page.our_services 'our_services', :action => 'our_services'
  end
  
  # Admin resources
  map.admin '/admin', :controller => 'admin/main', :action => 'index'
  map.resources :employment_opportunities, :controller => 'admin/employment_opportunities', :name_prefix => 'admin_', :path_prefix => '/admin'
  map.resources :research_studies, :controller => 'admin/research_studies', :name_prefix => 'admin_', :path_prefix => '/admin'  
  map.resources :employments, :controller => 'admin/opportunities', :name_prefix => 'admin_', :path_prefix => '/admin'
  map.resources :services, :controller => 'admin/services', :name_prefix => 'admin_', :path_prefix => '/admin'
  map.resources :users, :controller => 'admin/users', :name_prefix => 'admin_', :path_prefix => '/admin'
  
  map.resource :session, :name_prefix => 'admin_', :path_prefix => '/admin'
  # RESTful User actions FOR ADMIN ONLY
  map.logout '/logout', :controller => 'admin/sessions', :action => 'destroy', :name_prefix => 'admin_', :path_prefix => '/admin'  
  map.login '/login', :controller => 'admin/sessions', :action => 'new', :name_prefix => 'admin_', :path_prefix => '/admin'  
  map.register '/register', :controller => 'admin/users', :action => 'create', :name_prefix => 'admin_', :path_prefix => '/admin'  
  map.signup '/signup', :controller => 'admin/users', :action => 'new', :name_prefix => 'admin_', :path_prefix => '/admin'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => 'pages'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
