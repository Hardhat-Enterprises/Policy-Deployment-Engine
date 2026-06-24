resource "google_bigtable_app_profile" "non_compliant_example_1" {
  project        = "PDE"
  instance       = "nc"
  app_profile_id = "non_compliant_example_1"

  single_cluster_routing {
    cluster_id                 = "nc-cluster"
    allow_transactional_writes = true
  }
}
