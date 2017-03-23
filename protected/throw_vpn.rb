def start_vpn_connection(is_throw_vpn)
  return unless is_throw_vpn

  system 'sudo openvpn --config ./protected/openvpn.ovpn --auth-user-pass ./protected/credential --daemon'
  while `ifconfig | grep tun`.empty? do
    sleep 1
  end
  sleep 2
end

def end_vpn_connection(is_throw_vpn)
  return unless is_throw_vpn

  system 'sudo kill -9 ' + `pidof sudo openvpn`
end
