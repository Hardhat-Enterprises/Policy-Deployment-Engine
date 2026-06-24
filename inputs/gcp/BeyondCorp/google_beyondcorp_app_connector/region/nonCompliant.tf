
resource "google_service_account" "accnt_nc" {
  account_id = "nc-connector-sa-bad"
  project    = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_app_connector" "nc" {
  name = "nc"
  project = "smooth-verve-467716-v1"
  region = "us-central1"
  principal_info {
    service_account { 
      email = google_service_account.accnt_nc.email 
    }
  }
}
