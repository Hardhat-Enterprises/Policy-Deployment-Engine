# google_network_services_lb_route_extension — COMPLIANT example
# Exercises the arguments assessed as security_impact = true in the
# currently saved lb_route_extension_security_assessment.json:
#   deletion_policy, location, extension_chains.extensions.fail_open,
#   extension_chains.extensions.forward_headers

resource "google_compute_backend_service" "extension_backend" {
  name                  = "route-ext-backend"
  project               = var.project_id
  load_balancing_scheme = "INTERNAL_MANAGED"
  protocol              = "HTTP2"
}

resource "google_network_services_lb_route_extension" "example" {
  name                  = "example-route-extension"
  project                = var.project_id
  location                = "us-central1"          # COMPLIANT — drawn from the approved region whitelist
  load_balancing_scheme   = "INTERNAL_MANAGED"
  forwarding_rules         = [google_compute_forwarding_rule.example.self_link]

  deletion_policy = "PREVENT"                        # COMPLIANT — blocks silent removal from a live request path

  extension_chains {
    name = "chain1"

    match_condition {
      cel_expression = "request.host == 'api.example.com'"
    }

    extensions {
      name    = "auth-extension"
      service = google_compute_backend_service.extension_backend.self_link
      timeout = "0.5s"

      fail_open = false                              # COMPLIANT — a failing extension stops the request instead of being silently bypassed

      forward_headers = ["X-Request-Id", "X-Correlation-Id"]   # COMPLIANT — explicit minimal header set, not the send-everything default
    }
  }
}
