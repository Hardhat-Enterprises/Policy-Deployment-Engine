resource "google_gke_backup_backup_plan" "c" {
  name                = "c"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location    = "australia-southeast1"
  project     = "PDE"
  description = "Daily backup plan for production GKE cluster with 90-day retention policy. Backs up critical namespaces and persistent volumes."
}

