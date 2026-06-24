resource "google_database_migration_service_connection_profile" "c" {
    connection_profile_id = "c"
    display_name          = "dbms_mj_compliant"
    location              = "australia-southeast2"
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
          private_network = "projects/myProject/global/networks/default"
        }
        auto_storage_increase = true
        data_disk_type        = "PD_HDD"
        data_disk_size_gb     = "11"
        zone                  = "australia-southeast2-a"
        source_id             = "projects/gcp-project/locations/australia-southeast2/connectionProfiles/my-fromprofileid"
        root_password         = "testpasscloudsql"
        cmek_key_name         = "abcd"
      }
  }
}