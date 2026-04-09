resource "google_app_engine_application_url_dispatch_rules" "c" {
    project = "gcp-project-12345"
  dispatch_rules {
    domain  = "hardhat.pythonanywhere.com"
    path    = "/*"
    service = "default"
  }
}