require 'slack'

Slack.configure do |config|
  config.token = ENV['slack_api_token']
end

users = Slack.users_list

users['members'].each do |user|
  #puts user
  puts "-----"
  puts user['name']
  puts user['profile']['first_name']
  puts user['profile']['last_name']
  puts user['profile']['email']
  #puts "#{user["first_name"]} | #{user["last_name"]} | #{user["email"]}"
end
