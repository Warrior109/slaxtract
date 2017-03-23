#!/usr/bin/env ruby

require 'slack'
require './throw_vpn'

TOTAL = ARGV[0] || 100

Slack.configure do |config|
  config.token = ENV['slack_api_token']
end

start_time = Time.now
TOTAL.to_i.times do |i|
  begin
    auth = Slack.auth_test
  rescue => e
    puts "Error communicating with Slack: #{e} in request ##{i}"
    abort
  end

  unless auth['ok']
    puts "request ##{i} was aborted"
    puts auth
    abort
  end
end
end_time = Time.now
time = Time.at(end_time.to_i - start_time.to_i)
puts "The test with #{TOTAL} requests was success. Time of #{format('%0.2dh %0.2dm %0.2sec', time.to_i / 3600, time.min, time.sec)}"
