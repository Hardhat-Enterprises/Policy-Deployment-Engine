resource "google_iam_oauth_client" "nc" {
  oauth_client_id   = "example-client-id"
  display_name      = "23424asd"
  description       = "Invalid OAuth Client"
  location          = "global"
  disabled          = false
  allowed_grant_types = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://example.com"]
  allowed_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  client_type       = "CONFIDENTIAL_CLIENT"
    project               = "smooth-verve-467716-v1"
}