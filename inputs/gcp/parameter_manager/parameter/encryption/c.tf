# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "google_parameter_manager_parameter" "c" {
  parameter_id = "parameter-c"
  kms_key = "kms-key"
}
