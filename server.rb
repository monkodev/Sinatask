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

get '/listarsincompletar' do
	h=Tarea.all
	erb :listarsincompletar, :locals => {:ho => h}
end

get '/eliminartarea' do
	msg=""
	erb :eliminartarea, :locals => {:msgx => msg}
end

get '/deletetask' do
	if Tarea.find(params[:deletask].to_i)==true
		Tarea.destroy(params[:deletask])
		msg="Tarea eliminada correctamente"
	else
		msg="No existe la tarea ingresada"
	end
	erb :eliminartarea, :locals => {:msgx => msg}	
end
