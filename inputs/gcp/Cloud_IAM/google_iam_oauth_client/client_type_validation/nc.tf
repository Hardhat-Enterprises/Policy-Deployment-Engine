resource "google_iam_oauth_client" "nc" {
  oauth_client_id       = "nc"
  display_name          = "Invalid OAuth Client"
  description           = "Non-compliant OAuth client configuration"
  location              = "australia-southeast2"
  disabled              = false
  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://www.example.com"]
  allowed_scopes        = ["https://www.googleapis.com/auth/cloud-platform"]
  client_type           = "CLIENT_TYPE_UNSPECIFIED"
  project               = "smooth-verve-467716-v1"
}