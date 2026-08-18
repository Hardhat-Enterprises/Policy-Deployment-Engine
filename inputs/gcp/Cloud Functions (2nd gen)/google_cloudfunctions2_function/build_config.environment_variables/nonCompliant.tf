resource "google_cloudfunctions2_function" "non_compliant_example_1" {

  name = "non_compliant_example_1"
  location = "australia-southeast1"
  description = "a new function"

  build_config {
    runtime     = "nodejs20"
    entry_point = "entryPoint" # Set the entry point in the code
    environment_variables = {
      API_KEY = "my"
    }
  }
}
