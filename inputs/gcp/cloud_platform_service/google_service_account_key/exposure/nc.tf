// nc.tf (non-compliant examples)
resource "google_service_account" "nc_sa" {
  account_id   = "noncompliant-sa"
  display_name = "Noncompliant Service Account"
  project      = "proj-app-test988" 
}

resource "google_service_account_key" "nc1" {
  service_account_id = google_service_account.nc_sa.name
  private_key_type    = "TYPE_GOOGLE_CREDENTIALS_FILE"  # ❌ exports key
  key_algorithm       = "KEY_ALG_RSA_2048"              # ✅ okay
}

resource "google_service_account_key" "nc2" {
  service_account_id = google_service_account.nc_sa.name
  key_algorithm       = "KEY_ALG_RSA_2048"              # ✅ okay
  # ❌ missing keepers = no rotation detection
}

resource "google_service_account_key" "nc_key" {
  service_account_id = "projects/my-project/serviceAccounts/my-sa@my-project.iam.gserviceaccount.com"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"  # ❌ exports key
  key_algorithm      = "KEY_ALG_RSA_1024"              # ❌ insecure key
  # ❌ no keepers = no rotation
}