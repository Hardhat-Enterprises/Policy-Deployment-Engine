package network_services.ftp_anon

__metadata__ := {
  "title": "FTP anonymous access",
  "description": "Anonymous FTP access should be disabled",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "ftp"
  svc.anon_access == true
  msg := sprintf("FTP '%v' allows anonymous access", [svc.name])
}
