resource "google_service_account" "test_account" {
  account_id   = "my-account"
  display_name = "Service Account"
  project       = "pde"
}

resource "google_workflows_workflow" "c" {
  name          = "c"
  project       = "pde"
  region        = "australia-southeast1"
  service_account = google_service_account.test_account.id
  description   = "description"
  deletion_protection = true
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
