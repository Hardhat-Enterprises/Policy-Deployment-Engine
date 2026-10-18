resource "google_workflows_workflow" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  project       = "pde"
  region        = "australia-southeast1"
  description   = "description"
  deletion_protection = false
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

