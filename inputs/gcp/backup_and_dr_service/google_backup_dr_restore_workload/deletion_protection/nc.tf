resource "google_backup_dr_restore_workload" "nc" {
  location        = "australia-southeast1"
  backup_vault_id = "backup-vault"
  data_source_id  = "nc"
  backup_id       = "backup"

  compute_instance_target_environment {
    project = "my-project-4418-1743628379470"
    zone    = "australia-southeast1-a"
  }

  compute_instance_restore_properties {
    name                = "restored-instance-full"
    deletion_protection = false
  }
}