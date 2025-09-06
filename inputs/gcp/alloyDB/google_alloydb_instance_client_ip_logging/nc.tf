resource "google_alloydb_instance" "nc" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-abp-ok"
  instance_id   = "inst-query-bad"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-b"

  query_insights_config {
    record_client_address = false
    record_application_tags = false
    query_string_length = 64
  }
}
