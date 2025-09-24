package network_services.telnet

test_telnet_fail if {
  d := deny with input as {
    "services": [
      {"name": "telnet", "port": 23, "protocol": "tcp", "enabled": true}
    ]
  }
  count(d) == 1
}

test_telnet_pass if {
  d := deny with input as {
    "services": [
      {"name": "telnet", "port": 23, "protocol": "tcp", "enabled": false}
    ]
  }
  count(d) == 0
}
