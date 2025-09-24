package network_services.egress_allowlist

test_egress_fail if {
  d := deny with input as {
    "services": [
      {"name": "web", "port": 80, "protocol": "tcp"}
    ]
  }
  count(d) == 1
}

test_egress_pass if {
  d := deny with input as {
    "services": [
      {"name": "web", "port": 80, "protocol": "tcp", "destination_allow": ["10.0.0.0/8"]}
    ]
  }
  count(d) == 0
}
