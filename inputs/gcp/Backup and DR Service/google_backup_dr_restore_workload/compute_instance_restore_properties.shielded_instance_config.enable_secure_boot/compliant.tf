resource "google_backup_dr_restore_workload" "compliant_example_1" {
  location        = "australia-southeast1"
  backup_vault_id = "backup-vault"
  data_source_id  = "compliant_example_1"
  backup_id       = "backup"

  compute_instance_target_environment {
    project = "my-project-4418-1743628379470"
    zone    = "australia-southeast1-a"
  }

  compute_instance_restore_properties {
    name = "restored-instance-full"

    shielded_instance_config {
      enable_secure_boot = true
    }
  }
}
