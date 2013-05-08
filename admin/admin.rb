require 'sinatra'
require 'sinatra/flash'

class Admin < Sinatra::Application
	enable :sessions
	
	helpers do
	  def h(text)
	   	Rack::Utils.escape_html(text)
	  end
	end
end

require_relative '../models/init'
require_relative 'routes/news'