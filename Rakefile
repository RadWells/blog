require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require './connection'

namespace :db do
  desc 'create parlance db'
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE parlance;')
    conn.close
  end 

  desc 'drop parlance db'
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE parlance;')
    conn.close
  end
end