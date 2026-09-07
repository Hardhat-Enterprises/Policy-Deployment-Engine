resource "google_dataproc_autoscaling_policy" "non_compliant_example_1" {

  policy_id       = "non_compliant_example_1"
  location        = "europe-west1"
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