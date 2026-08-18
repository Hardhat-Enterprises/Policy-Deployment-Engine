resource "google_compute_autoscaler" "compliant_example_1" {
  name   = "compliant-example-1"
  zone   = "australia-southeast2-a"
  target = "google_compute_instance_group_manager.foobar.id"
  project = "pde"

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    stabilization_period = 300

    cpu_utilization {
      target = 0.5
    }
  }
}

