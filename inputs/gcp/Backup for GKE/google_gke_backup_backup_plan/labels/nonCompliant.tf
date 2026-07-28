resource "google_gke_backup_backup_plan" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"
  labels = {
      "environment" = "prod"
      # Missing cost-center and owner
  }
}

