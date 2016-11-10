require 'sinatra'
require 'make_todo'

get '/' do
	erb :index	
end

get '/nuevatarea' do
	erb :nuevatarea
	Tarea.create(params[:nuevatarea])
end