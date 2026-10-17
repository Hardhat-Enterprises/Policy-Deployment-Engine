resource "google_compute_region_composite_health_check" "non_compliant_example_1" {
  name               = "non-compliant-example-1"
  health_destination = "https://www.googleapis.com/compute/v1/projects/example-project/regions/australia-southeast1/forwardingRules/example-forwarding-rule"
  region             = "australia-southeast1"
  deletion_policy    = "DELETE"
}
