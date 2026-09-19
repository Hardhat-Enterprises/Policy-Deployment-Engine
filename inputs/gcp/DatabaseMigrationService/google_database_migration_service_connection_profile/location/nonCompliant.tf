resource "google_database_migration_service_connection_profile" "non_compliant_example_1" {
    connection_profile_id = "non_compliant_example_1"
    display_name          = "dbms_mj_compliant"
    location              = "us-central1"
    project               = "gcp-project-id"
    
    oracle {
        host = "host"
        port = 1521
        username = "username"
        password = "password"
        database_service = "dbprovider"
        private_connectivity {
           private_connection = "URI" 
        }
  }
}
