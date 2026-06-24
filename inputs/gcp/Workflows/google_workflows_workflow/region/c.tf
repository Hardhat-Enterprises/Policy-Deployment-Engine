resource "google_workflows_workflow" "c" {
  name          = "c"
  project       = "pde"
  region        = "australia-southeast1"
  description   = "description"
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
