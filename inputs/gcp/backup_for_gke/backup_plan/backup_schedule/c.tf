resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  backup_schedule {
    cron_schedule = "0 2 * * *"
    paused        = false
  }
}

