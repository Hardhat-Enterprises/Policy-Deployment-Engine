resource "google_compute_region_autoscaler" "compliant_example_1" {
  name             = "compliant-autoscaler"
  region           = "us-central1"
  target           = "https://www.googleapis.com/compute/v1/projects/my-project/regions/us-central1/instanceGroupManagers/my-group"
  deletion_policy  = "PREVENT"

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
  }
}
