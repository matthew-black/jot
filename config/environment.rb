require 'dotenv/load'
require 'unsplash'

# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'bcrypt'

begin
  require 'pry'
rescue LoadError
end

require 'erb'

# Some helper constants for path-centric logic:
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  # Sinatra assumes that the root is the file that calls the configure block.
  # Thankfully....APP_ROOT :)
  set :root, APP_ROOT.to_path

  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the controllers and helpers:
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Include ApplicationRecord:
require APP_ROOT.join('app', 'models', 'application_record').to_s

# Set up the database:
require APP_ROOT.join('config', 'database')

# Set up API tokens:
Unsplash.configure do |config|
  config.application_id     = ENV["APPLICATION_ID"]
  config.application_secret = ENV["APPLICATION_SECRET"]
  # Don't currently need this bit:
  # config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "jot"
end
