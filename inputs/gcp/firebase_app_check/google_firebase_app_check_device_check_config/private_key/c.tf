resource "google_firebase_app_check_device_check_config" "c" {
  app_id = "projects/my-project/apps/app1"
  key_id = "compliant-id"
  private_key = "projects/my-project/secrets/my-key"
}

resource "google_firebase_app_check_device_check_config" "c2" {
  app_id = "projects/different-project/apps/app2"
  key_id = "other-compliant-id"
  private_key = "projects/different-project/secrets/other-key"
}
