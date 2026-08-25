resource "google_compute_region_autoscaler" "compliant_example_1" {
  name             = "compliant-autoscaler"
  project          = "my-approved-project"
  region           = "us-central1"
  target           = "https://www.googleapis.com/compute/v1/projects/my-project/regions/us-central1/instanceGroupManagers/my-group"
  description      = "compliant_example_1"

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1
    metric {
      name   = "custom.googleapis.com/requests_per_instance"
      filter = "resource.type = \"gce_instance\" AND metric.labels.instance_name = \"web-server\""
      target = 100
    }
  }
}
