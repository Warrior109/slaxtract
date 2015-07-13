require 'csv'
require 'slack'

Slack.configure do |config|
  config.token = ENV['slack_api_token']
end

users = Slack.users_list

CSV.open('dump.csv', 'wb') do |csv|
  csv << ['Username', 'First Name', 'Last Name', 'Email']
  users['members'].each do |user|
    username = user['name']
    first_name = user['profile']['first_name']
    last_name = user['profile']['last_name']
    email = user['profile']['email']
    csv << [username, first_name, last_name, email]
  end
end

puts "Exported #{users['members'].count} Users"
