resource "google_gke_backup_restore_plan" "compliant_example_1" {
  name     = "rp-volume-bindings-c"
  project  = "PDE"
  location = "australia-southeast1"
  backup_plan = "projects/PDE/locations/australia-southeast1/backupPlans/bp1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/c1"
  restore_config {
    volume_data_restore_policy = "RESTORE_VOLUME_DATA_FROM_BACKUP"
    cluster_resource_restore_scope {
        all_group_kinds = true
    }
    all_namespaces = true
  }
}

resource "google_gke_backup_restore_plan" "compliant_example_2" {
  name                = "c"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "c"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    volume_data_restore_policy = "RESTORE_VOLUME_DATA_FROM_BACKUP"
  }
}
