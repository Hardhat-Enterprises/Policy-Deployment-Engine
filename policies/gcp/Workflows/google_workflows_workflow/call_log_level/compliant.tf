resource "google_workflows_workflow" "compliant_example_1" {
  name          = "compliant_example_1"
  project       = "pde"
  region        = "australia-southeast1"
  description   = "description"
  call_log_level = "LOG_ERRORS_ONLY"
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
