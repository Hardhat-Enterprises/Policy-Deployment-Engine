package network_services.dns

__metadata__ := {
  "title": "DNS open to the world",
  "description": "DNS should not be exposed to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "dns"
  svc.port == 53
  svc.protocol == "udp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("DNS '%v' is open to the world on port %v", [svc.name, svc.port])
}
