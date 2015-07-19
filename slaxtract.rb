require 'csv'
require 'slack'

Slack.configure do |config|
  config.token = ENV['slack_api_token']
end

begin
  auth = Slack.auth_test
rescue Faraday::Error::ConnectionFailed
  puts 'Cannot communicate with Slack. Check your Internet connection.'
  abort
end

unless auth['ok']
  puts 'There was a problem authenticating with Slack. Check your API token.'
  abort
end

users = Slack.users_list

begin
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
rescue => e
  puts "CSV Error: #{e}"
  abort
end

puts "Exported #{users['members'].count} users to dump.csv."
