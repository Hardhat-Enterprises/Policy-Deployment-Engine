package network_services.ftp_anon

test_ftp_fail if {
  d := deny with input as {
    "services": [
      {"name": "ftp", "port": 21, "protocol": "tcp", "anon_access": true}
    ]
  }
  count(d) == 1
}

test_ftp_pass if {
  d := deny with input as {
    "services": [
      {"name": "ftp", "port": 21, "protocol": "tcp", "anon_access": false}
    ]
  }
  count(d) == 0
}
