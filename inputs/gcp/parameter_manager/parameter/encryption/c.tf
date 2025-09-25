resource "google_parameter_manager_parameter" "c" {
  parameter_id = "parameter-c"
  kms_key = "kms-key"
}
