require 'slack-ruby-bot'

class Hal < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

Hal.run
