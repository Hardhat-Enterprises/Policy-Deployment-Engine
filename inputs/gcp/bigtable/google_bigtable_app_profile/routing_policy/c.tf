resource "google_bigtable_app_profile" "c123" {
  instance       = "c123"
  app_profile_id = "c123"
  routing_policy {
    single_cluster_routing {
      cluster_id = "c123"
    }
  }
}
