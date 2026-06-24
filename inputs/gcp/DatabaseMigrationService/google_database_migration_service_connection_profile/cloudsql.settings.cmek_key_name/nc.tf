resource "google_database_migration_service_connection_profile" "nc" {
    connection_profile_id = "nc"
    display_name          = "dbms_mj_non_compliant"
    location              = "us-central1"
    project               = "gcp-project-id"
    
    cloudsql {
      settings {
        database_version = "MYSQL_5_7"
        user_labels = { 
          cloudfoo = "cloudbar"
        }
        tier                      = "db-n1-standard-1"
        edition                   = "ENTERPRISE"
        storage_auto_resize_limit = "0"
        activation_policy         = "ALWAYS"
        ip_config {
          enable_ipv4 = true
          require_ssl = true
        }
        auto_storage_increase = true
        data_disk_type        = "PD_HDD"
        data_disk_size_gb     = "11"
        zone                  = "us-central1-b"
        source_id             = "projects/gcp-project/locations/us-central1/connectionProfiles/my-fromprofileid"
        root_password         = "testpasscloudsql"
      }
    }
}