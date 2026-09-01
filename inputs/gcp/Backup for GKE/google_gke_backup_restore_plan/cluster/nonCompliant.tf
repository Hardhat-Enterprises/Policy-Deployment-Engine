resource "google_gke_backup_restore_plan" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "c"
  cluster     = "" # Invalid: empty
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
  }
}

