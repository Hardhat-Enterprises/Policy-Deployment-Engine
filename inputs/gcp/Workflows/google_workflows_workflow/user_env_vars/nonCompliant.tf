resource "google_workflows_workflow" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  project       = "pde"
  region        = "australia-southeast1"
  description   = "description"
  deletion_protection = true
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

