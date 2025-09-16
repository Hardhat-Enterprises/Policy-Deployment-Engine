resource "google_service_account" "c_sa" {
  account_id   = "compliant-sa"
  display_name = "Compliant Service Account"
  project      = "proj-sec-test123"  
}

resource "time_rotating" "rotation" {
  rotation_days = 30
}

resource "google_service_account_key" "c1" {
  service_account_id = google_service_account.c_sa.name
  keepers = {
    rotation_time = time_rotating.rotation.rotation_rfc3339
  }
  public_key_type = "TYPE_X509_PEM_FILE"
  key_algorithm   = "KEY_ALG_RSA_2048" # ✅ Secure key
}
