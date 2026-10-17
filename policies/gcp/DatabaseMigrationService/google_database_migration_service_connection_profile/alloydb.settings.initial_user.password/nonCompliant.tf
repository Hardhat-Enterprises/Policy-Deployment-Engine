resource "google_database_migration_service_connection_profile" "non_compliant_example_1" {
  connection_profile_id = "non_compliant_example_1"
  display_name          = "dbms_mj_compliant"
  location              = "australia-southeast2"
  project               = "gcp-project-id"
  alloydb {
    cluster_id = "projects/gcp-project-id/locations/australia-southeast2/clusters/example"

    settings {
      vpc_network = "projects/gcp-project-id/global/networks/default"

      initial_user {
        user     = "admin"
        password = "weak-password"
      }
    }
  }
}
