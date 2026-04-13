resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  labels = {
    environment      = "prod"
    team             = "platform-engineering"
    compliance       = "required"
    backup-frequency = "daily"
    cost-center      = "engineering"
    owner            = "platform-team"
  }
}

