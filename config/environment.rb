require "bundler/setup"
# require "sinatra/activerecord"
Bundler.require
# require_all 'app/models'

# ENV['SINATRA_ENV'] ||= 'development'

# ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
)

require_relative'../app/model/character'
require_relative'../app/model/quote'
require_relative'../app/api'
require_relative'../app/cli'
require_relative'../app/service'
