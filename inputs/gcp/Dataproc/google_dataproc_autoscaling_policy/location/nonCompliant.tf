resource "google_dataproc_autoscaling_policy" "non_compliant_example_1" {
  policy_id = "dataproc-policy-noncompliant"
  location  = "asia-south1"

  worker_config {
    max_instances = 3
  }

  basic_algorithm {
    yarn_config {
      graceful_decommission_timeout = "30s"

      scale_up_factor   = 0.5
      scale_down_factor = 0.5
    }
  }
}