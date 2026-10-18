resource "google_compute_reservation" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "PDE"
  zone            = "us-central1-a"
  deletion_policy = "DELETE"

  specific_reservation {
    count = 1
    instance_properties {
      machine_type = "n2-standard-2"
    }
  }
}
