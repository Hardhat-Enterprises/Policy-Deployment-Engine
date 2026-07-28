resource "google_gke_backup_restore_plan" "compliant_example_1" {
  name                = "compliant_example_1"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "c"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production", "critical-apps"]
    }
    
    transformation_rules {
      description = "Security policy for restore"
      field_actions {
        op = "REMOVE"
        path = "/spec/serviceAccountName"
      }
    }
  }
}

