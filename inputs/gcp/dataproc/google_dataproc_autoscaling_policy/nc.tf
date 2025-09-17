# Defines a Dataproc Autoscaling Policy that violates cost and availability rules.
resource "google_dataproc_autoscaling_policy" "nc" {
  project   = "my-project-dataproc02" # 
  location  = "us-central1"
  policy_id = "policy-non-compliant"

  worker_config {
    # VIOLATION: Exceeds the maximum limit of 100.
    max_instances = 200
    # VIOLATION: Is below the minimum requirement of 2.
    min_instances = 1
  }
}