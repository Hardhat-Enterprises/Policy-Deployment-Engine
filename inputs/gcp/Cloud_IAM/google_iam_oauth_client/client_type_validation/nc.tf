resource "google_iam_oauth_client" "c" {
  oauth_client_id       = "nc"
  location              = "global"

  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://www.example.com"]
  allowed_scopes        = ["https://www.googleapis.com/auth/cloud-platform"]

  client_type           = "CINTERNAL_CLIENT"
}
