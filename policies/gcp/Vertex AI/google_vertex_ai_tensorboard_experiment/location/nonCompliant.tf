resource "google_vertex_ai_tensorboard_experiment" "non_compliant_example_1" {
  location                  = "europe-west1"
  tensorboard               = "projects/123456789/locations/europe-west1/tensorboards/fake-tensorboard"
  tensorboard_experiment_id = "non-compliant-experiment-1"
  deletion_policy           = "PREVENT"
}