resource "google_identity_platform_config" "non_compliant_example_1" {
  project = "fake-project"
  blocking_functions {
    triggers {
      event_type   = "beforeSignIn"
      function_uri = "https://australia-southeast1-fake-project.cloudfunctions.net/before-sign-in"
    }
    triggers {
      event_type   = "beforeCreate"
      function_uri = "http://example.invalid/before-create"
    }
  }
}

