resource "google_service_account" "nc" {
  account_id = "nc-connector-sa-bad"
  display_name = "AppConnector Security Account Bad"
}

resource "google_beyondcorp_app_connector" "nc" {
  name = "nc-region-bad"
  region = "us-central1"
  display_name = "Connector in unapproved region"
  principal_info {
    service_account { 
      email = google_service_account.nc.email 
    }
  }
}
