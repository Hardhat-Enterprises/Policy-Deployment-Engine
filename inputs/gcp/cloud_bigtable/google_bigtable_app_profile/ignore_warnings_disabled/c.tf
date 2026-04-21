resource "google_bigtable_app_profile" "c" {
  project        = "PDE"
  instance       = "c"
  app_profile_id = "c"

  single_cluster_routing {
    cluster_id                 = "c-cluster"
    allow_transactional_writes = true
  }

  ignore_warnings = false
}
