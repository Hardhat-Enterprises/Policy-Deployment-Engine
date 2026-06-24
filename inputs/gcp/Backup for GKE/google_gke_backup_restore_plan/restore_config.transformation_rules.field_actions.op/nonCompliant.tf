resource "google_gke_backup_restore_plan" "non_compliant_example_1" {
  name = "nc"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "nc"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
  }
}

resource "google_gke_backup_restore_plan" "non_compliant_example_2" {
  name = "nc"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "nc"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
  }
}
