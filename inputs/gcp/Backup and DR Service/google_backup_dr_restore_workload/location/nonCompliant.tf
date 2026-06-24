resource "google_backup_dr_restore_workload" "non_compliant_example_1" {
  location        = "us-central1"
  backup_vault_id = "backup-vault"
  data_source_id  = "non_compliant_example_1"
  backup_id       = "backup"

  compute_instance_target_environment {
    project = "my-project-4418-1743628379470"
    zone    = "australia-southeast1-a"
  }
}
