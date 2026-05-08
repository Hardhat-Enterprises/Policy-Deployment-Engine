resource "google_bigtable_app_profile" "nc" {
  project        = "PDE"
  instance       = "nc"
  app_profile_id = "nc"

  single_cluster_routing {
    cluster_id                 = "nc-cluster"
    allow_transactional_writes = false
  }

  ignore_warnings = true
}
