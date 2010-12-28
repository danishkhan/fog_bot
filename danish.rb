require 'sinatra'
require 'newrelic_rpm'

get '/' do
  'Hello world!'
end