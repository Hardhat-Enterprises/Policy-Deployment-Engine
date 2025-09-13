resource "google_chronicle_data_access_label" "c" {
  project               = "fake-test-project" 
  location              = "australia-southeast1"
  instance              = "00000000-0000-0000-0000-000000000000"
  data_access_label_id  = "c"
  udm_query             = "principal.hostname=\"google.com\""
  description           = "Compliant label with allowed udm_query"
}

