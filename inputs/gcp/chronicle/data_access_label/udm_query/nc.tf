resource "google_chronicle_data_access_label" "nc" {
  project               = "fake-test-project" 
  location              = "us"
  instance              = "00000000-0000-0000-0000-000000000000"
  data_access_label_id  = "nc"
  udm_query             = "principal.hostname=\"malicious.com\""
  description           = "Noncompliant label with wildcard udm_query"
}
