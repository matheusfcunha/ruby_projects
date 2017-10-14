require 'sinatra'
require 'sinatra/reloader'
require 'json'

file = File.read('data.json')
data_hash = JSON.parse(file)
formated_data = data_hash.each_value {|value| puts " #{value["username"]} > #{value["msg_count"]}"}


get '/' do
  erb :index, :locals => {:data_hash => data_hash, :formated_data => formated_data }
end
