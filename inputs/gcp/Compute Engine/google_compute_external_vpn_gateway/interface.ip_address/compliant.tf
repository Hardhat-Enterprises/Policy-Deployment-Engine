resource "google_compute_external_vpn_gateway" "compliant_example_1" {
  name            = "compliant-example-1"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"

  interface {
    id         = 0
    ip_address = "203.0.113.1"
  }
}