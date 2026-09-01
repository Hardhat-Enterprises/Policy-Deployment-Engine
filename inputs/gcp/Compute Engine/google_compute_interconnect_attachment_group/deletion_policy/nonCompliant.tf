resource "google_compute_interconnect_attachment_group" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  intent {
    availability_sla = "NO_SLA"
  }
  deletion_policy = "DELETE"
}