resource "google_apphub_application" "non_compliant_example_1"{
  project = "PDE"
  location = "australia-southeast1"
  application_id = "nc1"
  scope {
    type = "REGIONAL"
  }
}

resource "google_apphub_application" "non_compliant_example_2"{
  project = "PDE"
  location = "australia-southeast1"
  application_id = "nc2"
  scope {
    type = "REGIONAL"
  }
  attributes {}
}
