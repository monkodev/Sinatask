require 'sinatra'
require 'make_todo'


# sets root as the parent-directory of the current file
set :root, File.join(File.dirname(__FILE__), '')
# sets the view directory correctly
set :views, Proc.new { File.join(root, "views") } 


get '/' do
	erb :index1
end

get '/nuevatarea' do
	erb :nuevatarea
	Tarea.create(params[:nuevatarea])
end