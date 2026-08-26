resource "google_compute_region_autoscaler" "non_compliant_example_1" {
  name             = "non-compliant-autoscaler"
  project          = "my-approved-project"
  region           = "us-central1"
  target           = ""
  description      = "non_compliant_example_1"

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
  }
}
