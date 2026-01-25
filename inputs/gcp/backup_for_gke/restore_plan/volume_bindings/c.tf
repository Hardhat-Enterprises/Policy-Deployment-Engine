resource "google_gke_backup_restore_plan" "c" {
  name                = "c"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "c"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    
    volume_data_restore_policy_bindings {
      policy      = "NO_VOLUME_DATA_RESTORATION"
      volume_type = "GCE_PERSISTENT_DISK"
    }
  }
}

