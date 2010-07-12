ActionController::Routing::Routes.draw do |map|
  Typus::Routes.draw(map)

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resources :user_sessions
  map.resources :users

  map.resources :translations, 
                :collection => { :search => :get },
                :member => { :front => :get }

  map.connect 'search/:string', :controller => "translations", :action => "search"
  map.search  'search', :controller => "translations", :action => "search"
  map.short_search  's/:string', :controller => "translations", :action => "search"
  map.short_search  's/:string/:non_free', :controller => "translations", :action => "search"
  map.connect 'search/:string.:format', :controller => "translations", :action => "search"

  map.with_options :controller => 'static_pages' do |sp|
    sp.root  :action => "index"
    sp.errors    'errors', :action => "erros"
    sp.developers 'developers', :action => "developers"
    sp.credits 'credits', :action => "credits"
    sp.what_is_this 'what_is_this', :action => "what_is_this"
    sp.help     'help', :action => "help"
    sp.contact  'contact', :action => "contact"
    sp.glossaries 'glossaries', :action => "glossaries"
  end


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
