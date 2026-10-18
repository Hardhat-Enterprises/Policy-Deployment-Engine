resource "google_gke_hub_fleet" "compliant_example_1" {
  project         = "1234"
  display_name    = "compliant-fleet"
  deletion_policy = "PREVENT"
}