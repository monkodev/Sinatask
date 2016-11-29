require 'sinatra'
require 'make_todo'
require 'sinatra/static_assets'

get '/' do
	erb :index1
end

get '/nuevatarea' do
	erb :nuevatarea
end

get '/nuevatask' do
	Tarea.create(params[:newtask])
	redirect ('/')
end

get '/listarcompletadas' do
	h=Tarea.all
	erb :listarcompletadas, :locals => {:ho => h}
end
