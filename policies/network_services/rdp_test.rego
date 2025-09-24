package network_services.rdp

test_rdp_fail if {
  d := deny with input as {
    "services": [
      {"name": "rdp", "port": 3389, "protocol": "tcp", "allow": ["0.0.0.0/0"]}
    ]
  }
  count(d) == 1
}

test_rdp_pass if {
  d := deny with input as {
    "services": [
      {"name": "rdp", "port": 3389, "protocol": "tcp", "allow": ["10.0.0.0/8"]}
    ]
  }
  count(d) == 0
}
