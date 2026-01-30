resource "google_apphub_application" "nc"{
  project = "PDE"
  location = "global"
  application_id = "nc"
  scope {
    type = "GLOBAL"
  }
}



