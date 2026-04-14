resource "google_backup_dr_restore_workload" "nc" {
  location        = "australia-southeast1"
  backup_vault_id = "backup-vault"
  data_source_id  = "nc"
  backup_id       = "backup"

  # Set to false to keep the restored resource in GCP after terraform destroy
  delete_restored_instance = false

  compute_instance_target_environment {
    project = "my-project-4418-1743628379470"
    zone    = "australia-southeast1-a"
  }

  disk_restore_properties {
    name        = "disk-c"
    size_gb     = 100
    type        = "projects/tamim-shahriar/zones/australia-southeast1-b/diskTypes/pd-standard"
    access_mode = "READ_WRITE_SINGLE"
  }

  compute_instance_restore_properties {
    name         = "restored-instance-full"
    machine_type = "zones/australia-southeast1-a/machineTypes/e2-medium"
    description  = "Restored compute instance with advanced configuration"

    can_ip_forward      = true
    deletion_protection = true

    confidential_instance_config {
      enable_confidential_compute = true
    }

    shielded_instance_config {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  }
}