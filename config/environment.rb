require "bundler/setup"
Bundler.require

require "sinatra/activerecord"

# ENV['SINATRA_ENV'] ||= 'development'

# ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
)

require_relative "../app/model/character"
require_relative "../app/model/quote"
require_relative "../app/api"
require_relative "../app/cli"
require_relative "../app/iteration_database"

# require 'bundler/setup'
# Bundler.require

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

# require_all 'app'