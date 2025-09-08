resource "google_cloudfunctions2_function" "nc" {
  name     = "nc"
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
    available_memory   = "1024M"
    timeout_seconds    = 600  
    environment_variables = {
      GREETING = "Hello1"
    }
  }
}