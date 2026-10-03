resource "google_oracle_database_exadb_vm_cluster" "non_compliant_example_1" {
  exadb_vm_cluster_id = "test-exadb-cluster"
  location             = "us-east4"
  display_name         = "non_compliant_example_1"
  backup_odb_subnet    = "projects/test-project/locations/us-east4/odbNetworks/test-odb-network/odbSubnets/test-backup-subnet"
  odb_subnet           = "projects/test-project/locations/us-east4/odbNetworks/test-odb-network/odbSubnets/test-subnet"
  odb_network          = "projects/test-project/locations/us-east4/odbNetworks/test-odb-network"
  deletion_policy       = "PREVENT"
  deletion_protection   = true

  properties {
    cluster_name                = "testclus"
    enabled_ecpu_count_per_node = 4
    exascale_db_storage_vault   = "projects/test-project/locations/us-east4/exascaleDbStorageVaults/test-vault"
    grid_image_id                = "projects/test-project/locations/us-east4/gridImages/test-image"
    hostname_prefix              = "testhost"
    node_count                   = 2
    shape_attribute               = "SMART_STORAGE"
    ssh_public_keys               = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDtest test@example.com"]

    vm_file_system_storage {
      size_in_gbs_per_node = 100
    }

    data_collection_options {
      is_diagnostics_events_enabled = true
      is_health_monitoring_enabled  = true
      is_incident_logs_enabled      = false
    }
  }
}