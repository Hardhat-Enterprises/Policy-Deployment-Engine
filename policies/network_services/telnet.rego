package network_services.telnet

__metadata__ := {
  "title": "Telnet usage",
  "description": "Telnet should not be enabled (use SSH instead)",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "telnet"
  svc.port == 23
  svc.protocol == "tcp"
  svc.enabled == true
  msg := sprintf("Telnet '%v' is enabled on port %v", [svc.name, svc.port])
}
