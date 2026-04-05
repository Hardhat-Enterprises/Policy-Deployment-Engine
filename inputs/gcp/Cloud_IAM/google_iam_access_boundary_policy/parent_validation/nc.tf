resource "google_project" "nc_project" {
  project_id      = "my-project-id"
  name            = "My Project"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
}

resource "google_beyondcorp_app_connection" "nc" {
  name    = "my-app-connection"
  project = "invalid-project-format"  
  type    = "TCP_PROXY"

  application_endpoint {
    host = "foo-host"
    port = 8080
  }
}