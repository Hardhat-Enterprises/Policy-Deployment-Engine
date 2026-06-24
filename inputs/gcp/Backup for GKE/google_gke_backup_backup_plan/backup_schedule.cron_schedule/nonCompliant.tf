resource "google_gke_backup_backup_plan" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  backup_schedule {
    cron_schedule = "0 0 * * 0"
    paused        = true
  }
}

