resource "google_database_migration_service_connection_profile" "non_compliant_example_1" {
    connection_profile_id = "non_compliant_example_1"
    display_name          = "dbms_mj_non_compliant"
    location              = "us-central1"
    project               = "gcp-project-id"
    
    mysql {
        host = "host"
        port = 1521
        username = "username"
        password = "password"
        
        ssl {
          type = "NONE"
        }
    }
}
