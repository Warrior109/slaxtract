#!/usr/bin/env ruby

require 'csv'
require 'slack'
require 'yaml'
require './data'
require './protected/throw_vpn'

is_throw_vpn = ARGV[0] == 'true'

start_vpn_connection(is_throw_vpn) 

YAML.load_file('accounts.yml').each do |file_name, token|
  retrieve_data(file_name, token)
end

end_vpn_connection(is_throw_vpn) 
