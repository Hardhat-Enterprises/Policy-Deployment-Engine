resource "google_apphub_application" "compliant_example_1"{
  project = "PDE"
  location = "australia-southeast1"
  application_id = "c"
  scope {
    type = "REGIONAL"
  }
}

