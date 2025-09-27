resource "google_bigtable_app_profile" "nc123" {
  instance       = "nc123"
  app_profile_id = "nc123"
  
  single_cluster_routing {
    cluster_id = "nc123"
    allow_transactional_writes = false
  }
}