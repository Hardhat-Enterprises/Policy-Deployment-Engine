resource "google_apphub_application" "c"{
  project = "PDE"
  location = "control-plane namespace"
  application_id = "example-application-c"
  scope {
    type = "REGIONAL"
  }
}

