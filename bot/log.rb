# Defines a Slack bot to gather the team's daily log entries.
class HalBot < SlackRubyBot::Commands::Base
  command 'ping' do |client, data, _match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'die' do |client, data, _match|
    info = get_user_info client, data
    client.say(text: "I'm sorry, @#{info.name}. I'm afraid I can't do that.",
               channel: data.channel,
               gif: 'hal')
  end

  match /^(?<prefix>Also|Today) I (?<entry_text>.{5,10000})\.?$/i do |client, data, match|
    for_date = Time.now.strftime('%Y-%m-%d')
    begin
      log_entry = LogEntry.find_by user: data.user, for_date: for_date
    rescue ActiveRecord::RecordNotFound => _error
      log_entry = LogEntry.new user: data.user, for_date: for_date
    end
    text = match[:entry_text].capitalize
    if match[:prefix].casecmp('also').zero?
      log_entry.text += "\n#{text}"
    else
      log_entry.text = text
    end
    if log_entry.save
      client.say(text: 'okay!', channel: data.channel)
    else
      client.say(text: 'ups!', channel: data.channel)
    end
  end

  private

  def get_user_info(client, user_id)
    users_info = client.web_client.users_info(user: user_id)
    Hashie::Mash.new(users_info).user if users_info
  end
end
