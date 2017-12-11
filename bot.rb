require 'slack-ruby-bot'

class Hal < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'die' do |client, data, match|
    puts "==> CLIENT: #{client}"
    puts "==> DATA: #{data}"
    puts "==> MATCH: #{match}"
    users_info = client.web_client.users_info(user: data.user)
    info = Hashie::Mash.new(users_info).user if users_info
    client.say(text: "I'm sorry, @#{info.name}. I'm afraid I can't do that.", channel: data.channel, gif: 'hal')
  end

  command 'log'

end

Hal.run
