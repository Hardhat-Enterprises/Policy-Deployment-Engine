resource "google_firebase_app_check_device_check_config" "nc" {
  app_id      = "nc"
  key_id      = "nc-id"
  private_key = ""
}

resource "google_firebase_app_check_device_check_config" "nc2" {
  app_id      = "nc2"
  key_id      = "key-id-123"
  private_key = ""
}
