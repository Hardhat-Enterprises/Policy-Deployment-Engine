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
    
    cluster_resource_restore_scope {
      no_group_kinds = true
    }
  }
}

