resource "google_cloudfunctions_function" "c" {
  name            = "c"
  runtime         = "Python3.12"
  region          = "google_cloudfunctions_function.function.region"
  project         = "google_cloudfunctions_function.function.project"
  docker_registry = "ARTIFACT_REGISTRY"

}