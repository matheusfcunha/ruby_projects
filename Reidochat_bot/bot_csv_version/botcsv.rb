require 'telegram/bot'
require 'csv'


def save_data
  CSV.open("data.csv", "wb") {|csv| data.to_a.each {|elem| csv << elem} }
end

data = {}

token = '429734547:AAF-T03jlfI-3wgNPe0f1tuF-jokMQXiwbI'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when(/.../)
    msg = bot.api.getChatMember(chat_id: message.chat.id, user_id: message.from.id)
    user_first_name = msg['result']['user']['first_name']
    user_id = msg['result']['user']['id']

    if data.has_key?(user_id)
      data[user_id][:msg_count] += 1
    else
      data[user_id] = { :username => user_first_name, :msg_count => 1 }
    end

    puts data
    CSV.open("data.csv", "wb") {|csv| data.to_a.each {|elem| csv << elem} }
    end
  end
end
