resource "google_app_engine_application_url_dispatch_rules" "c" {
  project = "gcp-project12345"
  dispatch_rules {
    domain  = "*"
    path    = "/*"
    service = "default"
  }

  dispatch_rules {
    domain  = "*"
    path    = "/admin/*"
    service = "admin"
  }
}