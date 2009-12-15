ActionController::Routing::Routes.draw do |map|
  
  # STI
  map.resources :services, :employment_opportunities, :research_studies
  
  map.patients '/patients', :controller => 'patients'
  
  map.with_options :controller => 'patients' do |page|
    page.tips 'tips', :action => 'tips', :path_prefix => '/patients', :name_prefix => 'patients_'
    page.satisfaction 'satisfaction', :action => 'satisfaction', :path_prefix => '/patients', :name_prefix => 'patients_'
    page.schedule 'schedule', :action => 'schedule', :path_prefix => '/patients', :name_prefix => 'patients_'
    page.privacy 'privacy', :action => 'privacy', :path_prefix => '/patients', :name_prefix => 'patients_'
    page.faq 'faq', :action => 'faq', :path_prefix => '/patients', :name_prefix => 'patients_'
    page.records 'records', :action => 'records', :path_prefix => '/patients', :name_prefix => 'patients_'\
  end
  
  # Static pages
  map.with_options :controller => 'pages' do |page|
    page.about_us 'about_us', :action => 'about_us'
    page.contact_us 'contact_us', :action => 'contact_us'
    page.our_services 'our_services', :action => 'our_services'
    page.disclaimer 'disclaimer', :action => 'disclaimer'
    page.site_map 'site_map', :action => 'site_map'
    page.get_pollen_count 'get_pollen_count', :action => 'get_pollen_count'
    page.historical_pollen_count 'historical_pollen_count', :action => 'historical_pollen_count'
  end
  
  map.send_contact_form '/send_contact_form', :controller => 'pages', :action => 'send_contact_form'
  map.send_satisfaction_survey 'send_satisfaction_survey', :controller => 'pages', :action => 'send_satisfaction_survey'
  map.patient_privacy_practices 'patient_privacy_practices', :controller => 'pages', :action => 'patient_privacy_practices'  
   
  # Admin resources
  map.admin '/admin', :controller => 'admin/research_studies', :action => 'index'
  map.resources :employment_opportunities, :controller => 'admin/employment_opportunities', :name_prefix => 'admin_', :path_prefix => '/admin'
  map.resources :research_studies, :controller => 'admin/research_studies', :name_prefix => 'admin_', :path_prefix => '/admin'  
  map.resources :employments, :controller => 'admin/opportunities', :name_prefix => 'admin_', :path_prefix => '/admin'
  map.resources :services, :controller => 'admin/services', :name_prefix => 'admin_', :path_prefix => '/admin'
  map.resources :users, :controller => 'admin/users', :name_prefix => 'admin_', :path_prefix => '/admin'
  
  map.resource :session, :controller => 'admin/sessions', :name_prefix => 'admin_', :path_prefix => '/admin'
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
