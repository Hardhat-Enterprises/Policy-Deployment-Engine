resource "google_compute_autoscaler" "compliant_example_1" {
  name   = "compliant-example-1"
  target = "google_compute_instance_group_manager.foobar.id"
  zone   = "australia-southeast2-a"
  project = "pde"

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    stabilization_period = 300

    cpu_utilization {
      target = 0.5
    }

      scale_in_control {
        time_window_sec = 120
    }
  }
}
