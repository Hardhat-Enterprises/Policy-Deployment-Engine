resource "google_workflows_workflow" "nc" {
  name          = "nc"
  project       = "pde"
  region        = "us-central1"
  description   = "description"
  deletion_protection = false
  user_env_vars = {
    api_key = "key123"
    password = "password123"
  }
  labels = {
    env = "test"
  }
  source_contents = <<-EOF
  
  - getCurrentTime:
      call: http.get
      args:
          url: $${sys.get_env("url")}
      result: currentTime
EOF
}

