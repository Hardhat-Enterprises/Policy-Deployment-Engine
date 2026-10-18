resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]

  rules {
    action {
      fault_injection_policy {
        abort {
          percentage  = 100
          http_status = 503
        }
      }
    }
  }
}