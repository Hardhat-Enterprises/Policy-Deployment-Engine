resource "google_gke_backup_restore_plan" "c" {
  name        = "system-namespace-protected"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    all_namespaces = true
    excluded_namespaces {
      namespaces = ["kube-system", "kube-public", "kube-node-lease", "gke-system"]  # SECURE: System namespaces excluded
    }
  }
}