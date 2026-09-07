resource "google_dataproc_autoscaling_policy" "compliant_example_1" {
  policy_id       = "dataproc-policy-example"
  location        = "australia-southeast1"
  deletion_policy = "DELETE"

  worker_config {
    max_instances = 3
  }

  basic_algorithm {
    yarn_config {
      graceful_decommission_timeout = "30s"
      scale_up_factor                = 0.5
      scale_down_factor              = 0.5
    }
  }
}