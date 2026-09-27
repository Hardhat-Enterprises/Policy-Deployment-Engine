resource "google_database_migration_service_connection_profile" "non_compliant_example_1" {
  connection_profile_id = "non_compliant_example_1"
  display_name          = "dbms_mj_compliant"
  location              = "australia-southeast2"
  project               = "gcp-project-id"

  oracle {
    host             = "host"
    port             = 1521
    username         = "username"
    password         = "database-password"
    database_service = "dbprovider"

    forward_ssh_connectivity {
      hostname = "hostname"
      username = "ssh-user"
      port     = "22"
      password = "inline-ssh-password"
    }
  }
}
