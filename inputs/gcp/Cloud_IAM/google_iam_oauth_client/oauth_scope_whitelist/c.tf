resource "google_iam_oauth_client" "c" {
    project           = "smooth-verve-467716-v1"
  oauth_client_id       = "c"
  display_name          = "Secure OAuth Client"
  description           = "Uses least privilege scopes"
  location              = "australia-southeast2"
  disabled              = false

  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://www.example.com"]

  allowed_scopes = [
    "openid",
    "email"
  ]

  client_type = "CONFIDENTIAL_CLIENT"
}