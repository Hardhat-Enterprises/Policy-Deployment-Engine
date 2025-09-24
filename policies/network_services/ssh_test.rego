package network_services.ssh

test_ssh_fail if {
  d := deny with input as {
    "services": [
      {"name": "ssh", "port": 22, "protocol": "tcp", "allow": ["0.0.0.0/0"]}
    ]
  }
  count(d) == 1
}

test_ssh_pass if {
  d := deny with input as {
    "services": [
      {"name": "ssh", "port": 22, "protocol": "tcp", "allow": ["10.0.0.0/8"]}
    ]
  }
  count(d) == 0
}
