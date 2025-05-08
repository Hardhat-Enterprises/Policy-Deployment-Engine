# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant



resource "google_parameter_manager_regional_parameter" "nc" {
  parameter_id = "regional_parameter_nc"
  location = "us-west1"
}