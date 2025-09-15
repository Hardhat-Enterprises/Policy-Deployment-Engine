resource "google_alloydb_instance" "c" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-abp-ok"
  instance_id   = "inst-query-ok"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-a"

  query_insights_config {
    record_client_address = true
    record_application_tags = false
    query_string_length = 1024
  }
}
