data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_service_account" "accnt_nc" {
  account_id = "nc-connector-sa-bad"
  project    = data.google_project.project_nc.id
}

resource "google_beyondcorp_app_connector" "nc" {
  name = "nc"
  project = data.google_project.project_nc.id
  region = "us-central1"
  principal_info {
    service_account { 
      email = google_service_account.accnt_nc.email 
    }
  }
}
