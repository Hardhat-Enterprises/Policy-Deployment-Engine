# google_compute_region_backend_service: region
# Non-compliant when the region falls outside the approved-region whitelist.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name   = "non-compliant-example-1"
  region = "us-central1"
}
