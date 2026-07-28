resource "google_firebase_app_check_device_check_config" "non_compliant_example_1" {
  app_id      = "non_compliant_example_1"
  key_id      = "nc-id"
  private_key = ""
}

resource "google_firebase_app_check_device_check_config" "non_compliant_example_2" {
  app_id      = "non_compliant_example_2"
  key_id      = "key-id-123"
  private_key = ""
}
