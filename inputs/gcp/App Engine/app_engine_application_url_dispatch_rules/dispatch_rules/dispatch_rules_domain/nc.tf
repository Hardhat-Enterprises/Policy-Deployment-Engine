resource "google_app_engine_application_url_dispatch_rules" "nc" {
    project = "gcp-project-12345"
  dispatch_rules {
    domain  = "inavlid-domain.com"
    path    = "/*"
    service = "default"
  }
}