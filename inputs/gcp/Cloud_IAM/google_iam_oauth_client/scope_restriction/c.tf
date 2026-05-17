resource "google_iam_oauth_client" "c" {
  project           = "smooth-verve-467716-v1"
  oauth_client_id   = "c"
  location          = "global"

  client_type       = "CONFIDENTIAL_CLIENT"

  allowed_grant_types = ["AUTHORIZATION_CODE_GRANT"]

  allowed_redirect_uris = [
    "https://app.example.com/callback"
  ]

  allowed_scopes = [
    "openid",
    "email"
  ]
}