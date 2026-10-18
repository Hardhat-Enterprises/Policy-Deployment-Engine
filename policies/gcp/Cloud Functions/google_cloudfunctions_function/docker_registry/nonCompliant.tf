resource "google_cloudfunctions_function" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  runtime         = "Python3.12"
  region          = "google_cloudfunctions_function.function.region"
  project         = "google_cloudfunctions_function.function.project"
  docker_registry = "CONTAINER_REGISTRY"

}
