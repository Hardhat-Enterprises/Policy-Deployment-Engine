package network_services.rdp

__metadata__ := {
  "title": "RDP open to the world",
  "description": "RDP should not be open to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "rdp"
  svc.port == 3389
  svc.protocol == "tcp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("RDP '%v' is open to the world on port %v", [svc.name, svc.port])
}
