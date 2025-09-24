package network_services.smtp

test_smtp_fail if {
  d := deny with input as {
    "services": [
      {"name": "smtp", "port": 25, "protocol": "tcp", "open_relay": true}
    ]
  }
  count(d) == 1
}

test_smtp_pass if {
  d := deny with input as {
    "services": [
      {"name": "smtp", "port": 25, "protocol": "tcp", "open_relay": false}
    ]
  }
  count(d) == 0
}
