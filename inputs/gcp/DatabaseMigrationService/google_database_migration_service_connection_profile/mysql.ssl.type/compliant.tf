resource "google_database_migration_service_connection_profile" "compliant_example_1" {
    connection_profile_id = "compliant_example_1"
    display_name          = "dbms_mj_compliant"
    location              = "australia-southeast2"
    project               = "gcp-project-id"
    
    mysql {
        host = "host"
        port = 1521
        username = "username"
        password = "password"
        
        ssl {
          type = "REQUIRED"
        }
  }
}
