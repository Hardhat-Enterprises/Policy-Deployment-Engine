# Non-compliant: private_key is a hardcoded PEM-like string
# Real private keys must be stored in Secret Manager and referenced as projects/*/secrets/*
resource "google_firebase_app_check_device_check_config" "nc2" {
  app_id      = "projects/my-project/apps/app1"
  key_id      = "key-id-123"
  private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC7..."
}
