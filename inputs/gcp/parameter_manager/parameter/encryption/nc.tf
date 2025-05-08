# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant



resource "google_parameter_manager_parameter" "nc" {
  parameter_id = "parameter-nc"
}