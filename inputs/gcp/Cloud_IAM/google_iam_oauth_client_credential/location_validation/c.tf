resource "google_iam_oauth_client" "client_c" {
  oauth_client_id = "example-client-id"
  display_name    = "Valid OAuth Client"
  location        = "global"
  project         = "smooth-verve-467716-v1"
  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://example.com"]
  allowed_scopes        = ["https://www.googleapis.com/auth/cloud-platform"]
  client_type           = "CONFIDENTIAL_CLIENT"
}

resource "google_iam_oauth_client_credential" "c" {
  oauthclient                = google_iam_oauth_client.client_c.oauth_client_id
  location                   = "global"
  oauth_client_credential_id = "cred01"
  display_name               = "Valid Credential"
  project                    = "smooth-verve-467716-v1"
}