# Defines a Dataproc Autoscaling Policy that complies with cost and availability rules.
resource "google_dataproc_autoscaling_policy" "c" {
  project   = "my-project-dataproc02" 
  location  = "us-central1"
  policy_id = "c"

  worker_config {
    # Compliant: Within the allowed maximum.
    max_instances = 50
    # Compliant: Meets the minimum requirement.
    min_instances = 2
  }
}