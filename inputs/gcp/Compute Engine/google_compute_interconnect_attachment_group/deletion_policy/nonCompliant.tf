resource "google_compute_interconnect_attachment_group" "non_compliant_example_1" {
  name = "non-compliant-example-1"
  project = "my-project"
  deletion_policy = "DELETE"

  intent {
    availability_sla = "NO_SLA"
  }
  
}