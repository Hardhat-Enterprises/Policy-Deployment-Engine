resource "google_vertex_ai_tensorboard_experiment" "compliant_example_1" {
  location                  = "australia-southeast1"
  tensorboard               = "projects/123456789/locations/australia-southeast1/tensorboards/fake-tensorboard"
  tensorboard_experiment_id = "compliant-experiment-1"
  deletion_policy           = "PREVENT"
}