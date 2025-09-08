resource "google_service_account" "nc" {
  account_id   = "unapproved-connector"
  display_name = "Unapproved Connector Service_Account"
}

resource "google_beyondcorp_app_connector" "nc" {
  name   = "nc-service-account-bad"
  region = "australia-southeast1"
  principal_info {
    service_account { 
      email = google_service_account.nc.email 
    }
  }
}
