require 'slack-ruby-bot'

class Hal < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'die' do |client, data, match|
    client.say(text: "I'm sorry, #{data.user}. I'm afraid I can't do that.", channel: data.channel)
  end
end

Hal.run
