package network_services.dns

test_dns_fail if {
  d := deny with input as {
    "services": [
      {"name": "dns", "port": 53, "protocol": "udp", "allow": ["0.0.0.0/0"]}
    ]
  }
  count(d) == 1
}

test_dns_pass if {
  d := deny with input as {
    "services": [
      {"name": "dns", "port": 53, "protocol": "udp", "allow": ["192.168.0.0/16"]}
    ]
  }
  count(d) == 0
}
