resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]
  description = "Compliant HTTP route with a safe, bounded fault injection abort percentage"

  rules {
    action {
      fault_injection_policy {
        abort {
          percentage  = 5
          http_status = 503
        }
      }
    }
  }
}