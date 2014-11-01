require 'bundler'
Bundler.require

require './connection'
require './models/comment'
require './models/user'
require './models/entry'

require './helpers/permission_helpers.rb'

enable :sessions

# home page
get '/' do
  @entries = Entry.all
  erb :index
end

#create new user
get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  user.password = params[:password]
  user.save!
  redirect '/'
end


#get user log-in
get '/login' do
  erb :'sessions/login'
end

post '/sessions' do
  redirect '/login' unless user = User.find_by({username: params[:username]})
  if user.password == params[:password]
    session[:current_user] = user.id
    redirect '/'
  else
    redirect '/login' 
  end
end

#end session
delete '/sessions' do
  session[:current_user] = nil
  redirect '/'
end




# Entry CRUD


#get new post form
get '/entries/new' do
   erb :'entries/new'
end

#create new post
post '/entries' do
  new_title = params['title']
  new_body = params['body']
  Entry.create({:title => new_title, :body => new_body})
  redirect '/'
end

#show a single post
get "/entries/:id" do
  @entry = Entry.find(params[:id])
  erb :"entries/show" 
end

#get edit post form

get "/entries/edit/:id" do
  @entry = Entry.find(params[:id])
  erb :"entries/edit"
end

#edit a post
patch '/entries/:id' do
  entry = Entry.find(params[:id])
  newest_title = params['title']
  newest_body = params['body']
  entry.update({:title => newest_title, :body => newest_body})
  redirect '/'
end

#delete a post
delete "/entries/:id" do
  @entry = Entry.find(params[:id]).destroy
  redirect "/"
end

get "/about" do
  erb :about
  end

