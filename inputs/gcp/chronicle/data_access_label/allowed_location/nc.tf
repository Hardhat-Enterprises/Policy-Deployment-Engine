resource "google_chronicle_data_access_label" "nc" {
  project  = "fake-project"  
  location = "south-africa" 
  instance = "00000000-0000-0000-0000-000000000000"
  data_access_label_id = "nc"
  udm_query = "principal.hostname=\"google.com\""
  description = "label-description"
}