resource "google_app_engine_service_split_traffic" "non_compliant_example_1" {
  project = "gcp-project-12345"
  service = "generic-api"
  split {
    shard_by = "IP"
    allocations = {
      "v1" = 0.5
      "v2" = 0.5
    }
  }
}
