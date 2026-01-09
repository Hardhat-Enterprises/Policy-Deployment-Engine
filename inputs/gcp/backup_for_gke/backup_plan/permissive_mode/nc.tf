resource "google_gke_backup_backup_plan" "nc" {
  name     = "permissive-backup-plan"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true
    include_secrets = false
    permissive_mode = true  # SECURITY RISK: Continues backup even with errors
    selected_applications {
      namespaced_names {
        name = "app1"
        namespace = "ns1"
      }
    }
  }
}