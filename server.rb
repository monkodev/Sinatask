require 'sinatra'
require 'make_todo'

get '/' do
	erb :index1
end

get '/nuevatarea' do
	msg=""
	erb :nuevatarea, :locals => {:msgx => msg}
end

get '/nuevatask' do
	par=params[:newtask]
	if par.length > 0
		parm=params[:newtask].to_s.gsub(" ","_")
		#puts "PARAMETERRRRSSS:" "#{parm}" "#{parm.length.to_i}"	
		Tarea.create(parm)
		msg="Tarea ingresada correctamente!!!"
	else
		msg="No es posible ingresar esa tarea"
	end
	erb :nuevatarea, :locals => {:msgx => msg}	
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
	if Tarea.find(params[:deletask].to_i)!={"status"=>"404","error"=>"Not Found"}
		Tarea.destroy(params[:deletask].to_i)
		msg="Tarea eliminada correctamente"
	else
		msg="No existe la tarea ingresada"
	end
	erb :eliminartarea, :locals => {:msgx => msg}	
end

get '/actualizatarea' do
	msg=""
	erb :actualizatarea, :locals => {:msgx => msg}
end

get '/acttask' do
	if Tarea.find(params[:acttask].to_i)!={"status"=>"404","error"=>"Not Found"}
		Tarea.update(params[:acttask].to_i)
		msg="Tarea actualizada correctamente"
	else
		msg="No existe la tarea ingresada o no se puede actualizar"
	end
	erb :actualizatarea, :locals => {:msgx => msg}	
end