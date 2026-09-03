resource "google_compute_interconnect_attachment_group" "compliant_example_1" {
  name = "compliant-example-1"
  project = "my-project"
  deletion_policy = "PREVENT"
  
  intent {
    availability_sla = "NO_SLA"
  }
  
}