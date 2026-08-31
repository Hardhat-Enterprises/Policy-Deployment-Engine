resource "google_compute_region_commitment" "non_compliant_example_1" {
  name   = "non-compliant-example-1"
  plan   = "TWELVE_MONTH"
  region = "us-central1"
}