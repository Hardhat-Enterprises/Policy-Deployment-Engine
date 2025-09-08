resource "google_service_account" "c" {
  account_id = "c-connector-sa"
  display_name = "AppConnector Security Account"
}

resource "google_beyondcorp_app_connector" "c" {
  name = "c-region-ok"
  region = "australia-southeast1"
  display_name = "Connector in approved region"
  principal_info {
    service_account { 
      email = google_service_account.c.email 
    }
  }
}
