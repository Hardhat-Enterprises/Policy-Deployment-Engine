resource "google_compute_reservation" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "PDE"
  zone            = "australia-southeast1-a"
  deletion_policy = "PREVENT"

  specific_reservation {
    count = 1
    instance_properties {
      machine_type = "n2-standard-2"
    }
  }
}
