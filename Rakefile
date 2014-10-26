require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require './connection'

namespace :db do
  desc 'create wellsrobot db'
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE wellsrobot;')
    conn.close
  end 

  desc 'drop wellsrobot db'
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE wellsrobot;')
    conn.close
  end
end