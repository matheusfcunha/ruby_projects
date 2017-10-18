require 'telegram/bot'
require 'json'

def save_data
    File.open('data.json', 'wb') do |f|
        f.write(JSON.pretty_generate(data))
    end
end

data = {}

token = '429734547:AAF-T03jlfI-3wgNPe0f1tuF-jokMQXiwbI'
Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
        case message.text
        when /.../
            chat_info = bot.api.getChat(chat_id: message.chat.id, user_id: message.from.id)
            chat_id = "#{chat_info["result"]["id"]}.json"
            chat_title = chat_info["result"]["title"]
            user_photo_info = bot.api.getUserProfilePhotos(chat_id: message.chat.id, user_id: message.from.id, offset: 0, limit: 1)
            user_photo_id = user_photo_info["result"]["photos"][0]

            msg = bot.api.getChatMember(chat_id: message.chat.id, user_id: message.from.id)
            user_first_name = msg['result']['user']['first_name']
            user_id = msg['result']['user']['id']

            unless File.exist?("users_photos/#{user_id}.jpg")
              if user_photo_id != nil
              user_photo_id = user_photo_info["result"]["photos"][0][1]["file_id"]
              photo_info = bot.api.getFile(file_id: user_photo_id )
              photo_path = photo_info["result"]["file_path"]
              download_link = "https://api.telegram.org/file/bot#{token}/#{photo_path}"
              Dir.chdir("users_photos")
              %x(wget -O #{user_id}.jpg #{download_link})
              Dir.chdir("../")
              puts "User #{user_first_name} id: #{user_id} photo Downloaded!"
              end
           end

            unless File.exist?("groups_data/#{chat_id}")
            File.open("groups_data/#{chat_id}", "w") {|f| f.write(JSON.pretty_generate(data)) }
            end


            file = File.read("groups_data/#{chat_id}")
            data_hash = JSON.parse(file)

            if data_hash.key?(user_id.to_s)
                data_hash[user_id.to_s]["msg_count"] += 1
            else
                data_hash[user_id.to_s] = { "username" => user_first_name, "msg_count" => 1, "user_photo" => "users_photos/#{user_id}.jpg" }
            end


            data_hash = data_hash.sort_by {|key, value| value["msg_count"]}.reverse.to_h

            puts "#{chat_id} | #{chat_title} > #{user_first_name}(#{user_id}) msg count = #{data_hash[user_id.to_s]["msg_count"]} - #{Time.now.strftime("%k:%M:%S %b-%d")}"
            File.open("groups_data/#{chat_id}", "w") {|f| f.write(JSON.pretty_generate(data_hash)) }

            end
        end
    end
