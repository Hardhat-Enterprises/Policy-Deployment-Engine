package network_services.default_deny

test_default_deny_fail if {
  d := deny with input as {
    "services": [
      {"name": "smtp", "port": 25, "protocol": "tcp"}
    ]
  }
  count(d) == 1
}

test_default_deny_pass if {
  d := deny with input as {
    "services": [
      {"name": "smtp", "port": 25, "protocol": "tcp", "allow": ["192.168.1.0/24"]}
    ]
  }
  count(d) == 0
}
