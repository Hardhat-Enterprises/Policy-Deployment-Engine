resource "google_chronicle_data_access_label" "compliant_label" {
  project               = "fake-test-project" # ← Added for test purposes
  location              = "us"
  instance              = "00000000-0000-0000-0000-000000000000"
  data_access_label_id  = "label-compliant"
  udm_query             = "principal.hostname=\"google.com\""
  description           = "Compliant label with allowed udm_query"
}

