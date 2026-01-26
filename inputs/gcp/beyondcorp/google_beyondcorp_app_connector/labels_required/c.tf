
resource "google_service_account" "accnt_c" {
  account_id = "c-connector-sa"
  project    = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_app_connector" "c" {
  name    = "c"
  project = "smooth-verve-467716-v1"
  region  = "australia-southeast1"

  principal_info {
    service_account {
      email = google_service_account.accnt_c.email
    }
  }

  labels = {
    env = "production"
  }
}