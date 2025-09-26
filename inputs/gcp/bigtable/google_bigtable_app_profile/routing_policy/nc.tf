resource "google_bigtable_app_profile" "nc123" {
  instance       = "nc123"
  app_profile_id = "nc123"
  multi_cluster_routing_use_any = true
}
