resource "google_service_account" "c" {
  account_id   = "connector-a"
  display_name = "Approved Connector Service Account"
}

resource "google_beyondcorp_app_connector" "c" {
  name   = "c-service-account-ok"
  region = "australia-southeast1"
  principal_info {
    service_account { 
      email = google_service_account.c.email 
    }
  }
}
