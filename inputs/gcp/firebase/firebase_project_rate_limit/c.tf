


# Firebase Auth configuration with rate limiting
resource "google_identity_platform_config" "c" {
  project = "ankita-firebase-web-app"
  
  # Enable rate limiting
  blocking_functions {
    triggers {
      event_type = "beforeSignIn"
      function_uri = https://hello-770781975275.region.run.app
    }
  }
}
