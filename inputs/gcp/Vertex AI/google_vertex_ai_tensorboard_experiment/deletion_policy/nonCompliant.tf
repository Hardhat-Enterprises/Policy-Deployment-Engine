resource "google_vertex_ai_tensorboard_experiment" "non_compliant_example_1" {
  location                  = "australia-southeast1"
  tensorboard               = "projects/123456789/locations/australia-southeast1/tensorboards/fake-tensorboard"
  tensorboard_experiment_id = "non-compliant-experiment-1"
  deletion_policy           = "DELETE"
}

resource "google_vertex_ai_tensorboard_experiment" "non_compliant_example_2" {
  location                  = "australia-southeast1"
  tensorboard               = "projects/123456789/locations/australia-southeast1/tensorboards/fake-tensorboard"
  tensorboard_experiment_id = "non-compliant-experiment-2"
  
  
}