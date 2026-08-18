resource "google_compute_region_autoscaler" "non_compliant_example_1" {
  name             = "non-compliant-autoscaler"
  project          = "my-approved-project"
  region           = "asia-south1"
  target           = "https://www.googleapis.com/compute/v1/projects/my-project/regions/asia-south1/instanceGroupManagers/my-group"

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
  }
}
