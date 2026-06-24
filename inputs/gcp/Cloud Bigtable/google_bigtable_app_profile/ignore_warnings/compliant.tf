resource "google_bigtable_app_profile" "compliant_example_1" {
  project        = "PDE"
  instance       = "c"
  app_profile_id = "compliant_example_1"

  single_cluster_routing {
    cluster_id                 = "c-cluster"
    allow_transactional_writes = false
  }

  ignore_warnings = false
}
