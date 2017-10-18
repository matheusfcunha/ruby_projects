require 'json'

def create_directory
  Dir.chdir("groups_data")
  files = Dir.glob("*")
  Dir.chdir("../")


  app_file = File.read("rei_do_chat_app.rb")

  file_code =

  files.each do
    |file_name| file_name.delete(".json")
    unless app_file.include?(file_name)
      File.open("rei_do_chat_app.rb", 'a') { |file| file.write("\nget '/#{file_name.delete(".json")}' do\n  file = File.read('groups_data/#{file_name}')\n  data_hash = JSON.parse(file)\n   erb   :index, :locals => {:data_hash => data_hash}\n end\n" ) }
      puts "#{file_name} Directory created"
    end
  end

  puts "Waiting 60 Seconds for next directory checking/creation"

end


while true do
  create_directory
  sleep 60
end
