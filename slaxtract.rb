#!/usr/bin/env ruby

require 'csv'
require 'slack'

Slack.configure do |config|
  config.token = ENV['slack_api_token']
end

begin
  auth = Slack.auth_test
rescue => e
  puts "Error communicating with Slack: #{e}"
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
  puts "Error exporting to dump.csv: #{e}"
  abort
end

puts "Exported #{users['members'].count} user(s) to dump.csv."
