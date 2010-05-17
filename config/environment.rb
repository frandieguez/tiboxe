ENV['RAILS_ENV'] = 'production'
# Non empregamos a ultima version
#RAILS_GEM_VERSION = '2.2.3' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  # config.i18n.load_path << Dir[File.join(RAILS_ROOT, 'my', 'locales', '*.{rb,yml}')]

  config.i18n.default_locale = :es
  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_tiboxe_session',
    :secret      => '77fc4424559b0c369ca4d27dc94ebb3703fcd658f7cc1d09554bade371f173f72aefb3b36caea7e402db0db384f2f7dab53927fc3ad816f59f99ac4729562c0f'
  }
  
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer


end
