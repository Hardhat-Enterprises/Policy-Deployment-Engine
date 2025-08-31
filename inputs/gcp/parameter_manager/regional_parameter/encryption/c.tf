resource "google_parameter_manager_regional_parameter" "c" {
  parameter_id = "regional_parameter_c"
  location = "australia-southeast1"

  kms_key = "kms-key"
}
