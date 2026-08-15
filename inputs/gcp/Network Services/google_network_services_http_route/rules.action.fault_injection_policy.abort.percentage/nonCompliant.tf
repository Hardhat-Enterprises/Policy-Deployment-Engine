resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route with an excessive fault injection abort percentage"

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