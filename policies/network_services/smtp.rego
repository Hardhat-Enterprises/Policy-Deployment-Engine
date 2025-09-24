package network_services.smtp

__metadata__ := {
  "title": "SMTP open relay",
  "description": "SMTP should not be an open relay",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "smtp"
  svc.open_relay == true
  msg := sprintf("SMTP '%v' is configured as an open relay", [svc.name])
}
