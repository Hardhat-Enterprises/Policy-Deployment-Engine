resource "google_compute_interconnect_attachment_group" "compliant_example_1" {
  name = "compliant_example_1"
  intent {
    availability_sla = "NO_SLA"
  }
  deletion_policy = "PREVENT"
}