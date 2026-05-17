resource "google_iam_oauth_client" "nc" {
   project           = "smooth-verve-467716-v1"
  oauth_client_id       = "nc"
  location              = "global"

  client_type           = "CONFIDENTIAL_CLIENT"

  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]

  allowed_redirect_uris = [
    "http://malicious.example.com/callback"
  ]

  allowed_scopes = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]

  display_name = "Insecure OAuth Client"
  description  = "Uses overly broad scope"
}