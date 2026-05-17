resource "google_iam_oauth_client" "nc" {
    project           = "smooth-verve-467716-v1"
  oauth_client_id       = "nc"
  display_name          = "Unsafe OAuth Client"
  description           = "Uses overly broad scope"
  location              = "global"
  disabled              = false

  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://www.example.com"]


  allowed_scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "openid"
  ]

  client_type = "CONFIDENTIAL_CLIENT"
}