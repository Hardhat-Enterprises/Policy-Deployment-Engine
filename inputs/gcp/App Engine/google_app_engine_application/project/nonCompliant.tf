# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_app_engine_application" "non_compliant_example_1" {
  project     = "invalid-project"
  location_id = "australia-southeast1"
}
