resource "google_firebase_app_check_device_check_config" "c" {
  app_id = "c"
  key_id = "compliant-id"
  private_key = "projects/my-project/secrets/my-key"
}

resource "google_firebase_app_check_device_check_config" "c2" {
  app_id = "c2"
  key_id = "other-compliant-id"
  private_key = "projects/different-project/secrets/other-key"
}
