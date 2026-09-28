resource "google_compute_interconnect_group" "compliant_example_1" {
  name = "compliant-interconnect-group"

  intent {
    topology_capability = "NO_SLA"
  }

  deletion_policy = "DELETE"
}
