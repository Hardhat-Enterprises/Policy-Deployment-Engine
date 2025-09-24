package network_services.ssh

__metadata__ := {
  "title": "SSH open to the world",
  "description": "SSH service should not be open to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "ssh"
  svc.port == 22
  svc.protocol == "tcp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("SSH '%v' is open to the world on port %v", [svc.name, svc.port])
}