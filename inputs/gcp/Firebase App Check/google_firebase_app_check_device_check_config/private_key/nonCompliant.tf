resource "google_firebase_app_check_device_check_config" "non_compliant_example_1" {
  app_id      = "non_compliant_example_1"
  key_id      = "compliant-id"
  private_key = ""
}

resource "google_firebase_app_check_device_check_config" "non_compliant_example_2" {
  app_id      = "non_compliant_example_2"
  key_id      = "other-compliant-id"
  private_key = ""
}
