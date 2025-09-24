package network_services.http_to_https

test_http_fail if {
  d := deny with input as {
    "services": [
      {"name": "http", "port": 80, "protocol": "tcp", "redirect_https": false}
    ]
  }
  count(d) == 1
}

test_http_pass if {
  d := deny with input as {
    "services": [
      {"name": "http", "port": 80, "protocol": "tcp", "redirect_https": true}
    ]
  }
  count(d) == 0
}
