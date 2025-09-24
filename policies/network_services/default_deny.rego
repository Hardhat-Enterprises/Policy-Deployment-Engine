package network_services.default_deny

__metadata__ := {
  "title": "Default deny all",
  "description": "Traffic should be denied unless explicitly allowed",
  "severity": "medium"
}

deny[msg] if {
  svc := input.services[_]
  not svc.allow
  msg := sprintf("Service '%v' on port %v has no allow rules (denied by default)", [svc.name, svc.port])
}

