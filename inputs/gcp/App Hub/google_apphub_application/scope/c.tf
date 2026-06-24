resource "google_apphub_application" "c"{
  project = "PDE"
  location = "australia-southeast1"
  application_id = "c"
  scope {
    type = "REGIONAL"
  }
}

