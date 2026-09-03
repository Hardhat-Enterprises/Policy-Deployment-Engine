resource "google_compute_wire_group" "non_compliant_example_1" {
  name                = "non-compliant-wire-group"
  description         = "non_compliant_example_1"
  cross_site_network  = "test-cross-site-network"
  deletion_policy     = "DELETE"

  wire_properties {
    bandwidth_unmetered   = 10
    fault_response        = "NONE"
    bandwidth_allocation  = "ALLOCATE_PER_WIRE"
  }

  admin_enabled = true
}
