resource "google_apphub_application" "non_compliant_example_1"{
  project = "PDE"
  location = "global"
  application_id = "nc"
  scope {
    type = "GLOBAL"
  }
}

