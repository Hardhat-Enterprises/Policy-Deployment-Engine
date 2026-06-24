resource "google_gke_backup_backup_plan" "compliant_example_1" {
  name                = "compliant_example_1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  labels = {
    environment = "prod"
    team             = "platform-engineering"
    compliance       = "required"
    backup-frequency = "daily"
    cost-center      = "engineering"
    owner            = "platform-team"
  }
}

