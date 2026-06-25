resource "google_chronicle_data_access_label" "compliant_example_1" {
  project              = "fake-test-project"
  location             = "australia-southeast1"
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_label_id = "compliant_example_1"
  udm_query            = "principal.hostname=\"google.com\""
  description          = "Compliant label with allowed udm_query"
}

