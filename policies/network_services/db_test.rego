package network_services.db

test_db_fail if {
  d := deny with input as {
    "services": [
      {"name": "db", "port": 3306, "protocol": "tcp", "allow": ["0.0.0.0/0"]}
    ]
  }
  count(d) == 1
}

test_db_pass if {
  d := deny with input as {
    "services": [
      {"name": "db", "port": 3306, "protocol": "tcp", "allow": ["10.0.0.0/8"]}
    ]
  }
  count(d) == 0
}
