package network_services.egress_allowlist

__metadata__ := {
  "title": "Egress allowlist enforcement",
  "description": "Egress traffic should only be allowed to explicitly allowed networks",
  "severity": "medium"
}

deny[msg] if {
  svc := input.services[_]
  not svc.destination_allow
  msg := sprintf("Service '%v' has no destination allowlist", [svc.name])
}
