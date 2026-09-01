# google_network_services_lb_route_extension — NON-COMPLIANT example

resource "google_network_services_lb_route_extension" "example" {
  name                  = "example-route-extension"
  project                = var.project_id
  location                = "us-central1"
  load_balancing_scheme   = "INTERNAL_MANAGED"
  forwarding_rules         = [google_compute_forwarding_rule.example.self_link]

  deletion_policy = "DELETE"                          # VIOLATION deletion_policy — extension can be silently removed from a live request path

  extension_chains {
    name = "chain1"

    match_condition {
      cel_expression = "request.host == 'api.example.com'"
    }

    extensions {
      name    = "auth-extension"
      service = google_compute_backend_service.extension_backend.self_link
      timeout = "0.5s"

      fail_open = true                                 # VIOLATION fail_open — a failed or slow extension is silently bypassed

      # forward_headers omitted                          # VIOLATION forward_headers — every header, including Authorization and Cookie, is forwarded by default
    }
  }
}
