require 'sinatra'
require 'sinatra/reloader'
require 'json'



#file = File.read('data.json')
#data_hash = JSON.parse(file)


#get '/' do
#  erb :index, :locals => {:data_hash => data_hash}
#end


get '/' do
  "hello index page"
end

get '/-288236385' do
  file = File.read('groups_data/-288236385.json')
  data_hash = JSON.parse(file)
  formatted_data = ""
  data_hash.values.each {|x| formatted_data << " #{x["username"]} => #{x["msg_count"]}<br" }
 erb :index, :locals => {:data_hash => data_hash, :formatted_data => formatted_data}
 end

get '/81515082' do
  file = File.read('groups_data/81515082.json')
  data_hash = JSON.parse(file)
 erb :index, :locals => {:data_hash => data_hash}
 end

get '/-293341442' do
  file = File.read('groups_data/-293341442.json')
  data_hash = JSON.parse(file)
 erb :index, :locals => {:data_hash => data_hash}
 end

get '/-1001142649510' do
  file = File.read('groups_data/-1001142649510.json')
  data_hash = JSON.parse(file)
  formatted_data = ""
  data_hash.values.each { |x| formatted_data <<  %Q[ #{x["username"]} => #{x["msg_count"]}<br> ] }
 erb :index, :locals => {:data_hash => data_hash, :formatted_data => formatted_data}
 end

get '/-251901337' do
  file = File.read('groups_data/-251901337.json')
  data_hash = JSON.parse(file)
   erb   :index, :locals => {:data_hash => data_hash}
 end
