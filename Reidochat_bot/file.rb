
get '/#{file_name.delete(".json")}' do
  file = File.read('groups_data/#{file_name}')
  data_hash = JSON.parse(file)
end
