resource "google_gke_backup_restore_plan" "c" {
  name                = "c"
  location    = "australia-southeast1"
  backup_plan        = "c"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  description = "A valid restore plan for testing purposes."
  project     = "PDE"

  restore_config {
    all_namespaces = true
  }

}
