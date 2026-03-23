# Non-compliant: site_secret is a hardcoded API-key-like string
# Secure setups must use a Secret Manager reference: projects/*/secrets/*
resource "google_firebase_app_check_recaptcha_v3_config" "nc2" {
  app_id      = "projects/my-project/apps/app1"
  site_secret = "api-v3-key-12345-exposed-in-tf"
}
