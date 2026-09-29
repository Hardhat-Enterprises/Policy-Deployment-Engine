# google_compute_region_backend_service: region
# Compliant when the region is inside the approved-region whitelist.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name   = "compliant-example-1"
  region = "australia-southeast1"
}
