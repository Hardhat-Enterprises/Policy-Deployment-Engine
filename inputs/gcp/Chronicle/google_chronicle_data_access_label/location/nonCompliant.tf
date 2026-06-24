resource "google_chronicle_data_access_label" "non_compliant_example_1" {
  project              = "fake-project"
  location             = "south-africa"
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_label_id = "non_compliant_example_1"
  udm_query            = "principal.hostname=\"google.com\""
  description          = "label-description"
}
