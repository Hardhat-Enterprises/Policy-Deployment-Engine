resource "google_compute_interconnect_group" "non_compliant_example_1" {
  name = "non-compliant-interconnect-group"

  intent {
    topology_capability = "NO_SLA"
  }

  deletion_policy = "ABANDON"
}
