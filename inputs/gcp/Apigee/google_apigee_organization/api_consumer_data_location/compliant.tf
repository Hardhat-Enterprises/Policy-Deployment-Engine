# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
resource "google_apigee_organization" "compliant_example_1" {
  project_id                  = "compliant_example_1"
  analytics_region            = "australia-southeast1"
  api_consumer_data_location  = "australia-southeast1"
}