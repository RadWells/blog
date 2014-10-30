require 'bundler'
Bundler.require

require './connection'
require './models/comment'
require './models/user'
require './models/entry'

require './helpers/permission_helpers.rb'

enable :sessions

get '/' do
  @entries = Entry.all
  erb :index
end

post '/users/new' do
  user = User.new(params[:user])
  user.password = params[:password]
  user.save!
  redirect '/'
end

get '/login' do
  erb :'sessions/login'
end

post '/sessions' do
  redirect '/' unless user = User.find_by({name: params[:name]})
  if user.password == params[:password]
    session[:current_user] = user.id
    redirect '/index'
  else
    redirect '/' 
  end
end

delete '/sessions' do
  session[:current_user] = nil
  redirect '/index'
end

get '/entries/new' do
  erb :'entries/new'
end

get "/entries/:id" do
  @entry = Entry.find(params[:id])
  erb :"entries/show" 
end

post '/entries' do
  new_title = params['title']
  new_body = params['body']
Entry.create({:title => new_title, :body => new_body})
  redirect '/index'
end

patch '/entries/:id' do
  entry = Entry.find(params[:id])
  newest_title = params['title']
  newest_body = params['body']
  entry.update({:title => newest_title, :body => newest_body})
  redirect '/index'

end
delete "/entries/:id" do
  @entry = Entry.find(params[:id]).destroy
  redirect "/"
end
