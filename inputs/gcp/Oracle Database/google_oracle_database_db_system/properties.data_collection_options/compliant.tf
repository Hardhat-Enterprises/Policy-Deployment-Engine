resource "google_oracle_database_db_system" "compliant_example_1" {
  db_system_id = "my-instance"
  display_name = "my-instance displayname"
  location     = "europe-west2"
  project      = "my-project"
  odb_network  = "projects/my-project/locations/europe-west2/odbNetworks/my-odbnetwork"
  odb_subnet   = "projects/my-project/locations/europe-west2/odbNetworks/my-odbnetwork/odbSubnets/my-odbsubnet"

  properties {
    ssh_public_keys = ["ssh-rsa AAAAB3... nobody@google.com"]
    compute_count                = "4"
    hostname_prefix              = "hostname1"
    shape                        = "VM.Standard.x86"
    initial_data_storage_size_gb = "256"
    database_edition             = "STANDARD_EDITION"
    license_model                = "LICENSE_INCLUDED"

    time_zone {
      id = "UTC"
    }

    data_collection_options {
      is_diagnostics_events_enabled = true
      is_incident_logs_enabled      = true
    }

    db_home {
      db_version = "19.0.0.0"

      database {
        admin_password = "ABcde_1#234"
        database_id    = "mydb"
        db_name        = "db"
        db_unique_name = "db"
      }
    }
  }

  gcp_oracle_zone     = "us-east4-b-r2"
  deletion_policy     = "PREVENT"
  deletion_protection = true
}