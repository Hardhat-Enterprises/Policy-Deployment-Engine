resource "google_database_migration_service_connection_profile" "compliant_example_1" {
  connection_profile_id = "compliant_example_1"
  display_name          = "dbms_mj_compliant"
  location              = "australia-southeast2"
  project               = "gcp-project-id"
  cloudsql {
    settings {
      database_version = "MYSQL_5_7"
      tier             = "db-n1-standard-1"
      source_id        = "projects/gcp-project/locations/australia-southeast2/connectionProfiles/my-fromprofileid"

      database_flags = {
        cloudsql_iam_authentication = "on"
      }

      ip_config {
        enable_ipv4     = true
        require_ssl     = true
        private_network = "projects/myProject/global/networks/default"
      }

      cmek_key_name = "abcd"
      root_password = "testpasscloudsql"
    }
  }
}
