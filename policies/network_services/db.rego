package network_services.db

__metadata__ := {
  "title": "DB open to the world",
  "description": "Databases should not be exposed to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "db"
  svc.port == 3306
  svc.protocol == "tcp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("Database '%v' is open to the world on port %v", [svc.name, svc.port])
}
