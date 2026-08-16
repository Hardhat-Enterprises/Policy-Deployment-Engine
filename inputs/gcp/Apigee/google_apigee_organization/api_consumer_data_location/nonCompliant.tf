# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_apigee_organization" "non_compliant_example_1" {
  project_id                  = "non_compliant_example_1"
  analytics_region            = "australia-southeast1"
  api_consumer_data_location  = "us-central1"
}