resource "google_iam_oauth_client" "c" {
  oauth_client_id       = "example-client-01"
  display_name          = "Valid OAuth Client"
  description           = "Compliant OAuth client"
  location              = "australia-southeast2"
  disabled              = false
  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://www.example.com/callback"]
  allowed_scopes        = ["openid", "email", "groups"]
  client_type           = "CONFIDENTIAL_CLIENT"
  project               = "smooth-verve-467716-v1"
}