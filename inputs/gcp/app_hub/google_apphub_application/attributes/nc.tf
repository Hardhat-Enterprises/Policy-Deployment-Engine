resource "google_apphub_application" "nc1"{
  project = "PDE"
  location = "control-plane namespace"
  application_id = "example-application-nc1"
  scope {
    type = "REGIONAL"
  }
}

resource "google_apphub_application" "nc2"{
  project = "PDE"
  location = "control-plane namespace"
  application_id = "example-application-nc2"
  scope {
    type = "REGIONAL"
  }
  attributes {}
}
