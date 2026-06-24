resource "google_cloudfunctions2_function" "c" {

  name = ""
  location = "us-central1"
  description = "a new function"

  build_config {
    runtime     = "nodejs20"
    entry_point = "entryPoint" # Set the entry point in the code
    environment_variables = {
      BUILD_CONFIG_TEST = "build_test"
    }
  }
}