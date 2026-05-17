resource "google_workflows_workflow" "c" {
  name          = "c"
  project       = "pde"
  region        = "australia-southeast1"
  description   = "description"
  execution_history_level = "EXECUTION_HISTORY_BASIC"
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
