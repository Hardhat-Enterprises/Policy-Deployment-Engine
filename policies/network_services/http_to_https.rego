package network_services.http_to_https

__metadata__ := {
  "title": "HTTP to HTTPS redirect",
  "description": "Services should enforce HTTPS instead of plain HTTP",
  "severity": "medium"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "http"
  not svc.redirect_https
  msg := sprintf("HTTP service '%v' does not enforce HTTPS redirection", [svc.name])
}
