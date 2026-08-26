resource "google_compute_region_autoscaler" "non_compliant_example_1" {
  name             = "non-compliant-autoscaler"
  project          = "my-approved-project"
  region           = "us-central1"
  target           = "https://www.googleapis.com/compute/v1/projects/my-project/regions/us-central1/instanceGroupManagers/my-group"
  description      = "non_compliant_example_1"

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
    scaling_schedules {
      name                   = "weekday-morning-peak"
      disabled               = false
      duration_sec           = 3600
      min_required_replicas  = 3
      schedule               = ""
      time_zone              = "Australia/Melbourne"
    }
  }
}
