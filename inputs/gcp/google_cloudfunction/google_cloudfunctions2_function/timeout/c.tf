resource "google_cloudfunctions2_function" "c" {
  name     = "c"
  location = "us-central1"

  build_config {
    runtime     = "python311"
    entry_point = "hello_world"
    source {
      storage_source {
        bucket = "dummy-bucket" 
        object = "source.zip"   
      }
    }
  }

  service_config {
    max_instance_count = 2
    available_memory   = "512M"
    timeout_seconds    = 120
    ingress_settings   = "ALLOW_INTERNAL_ONLY"
    environment_variables = {
      GREETING = "Hello"
    }
  }
}