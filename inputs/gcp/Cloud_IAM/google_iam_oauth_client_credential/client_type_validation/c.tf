resource "google_iam_oauth_client" "oauth_client1" {
  oauth_client_id           = "example-client-id"
  location                  = "global"
  allowed_grant_types       = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris     = ["https://www.example.com"]
  allowed_scopes            = ["https://www.googleapis.com/auth/cloud-platform"]
  client_type               = "CONFIDENTIAL_CLIENT"
  project               = "smooth-verve-467716-v1"
}

resource "google_iam_oauth_client_credential" "c" {
  oauthclient                   = google_iam_oauth_client.oauth_client1.oauth_client_id
  location                      = "global"
  oauth_client_credential_id    = "cred-id"
  disabled                      = true
  display_name                  = "Display Name of credential"
   project               = "smooth-verve-467716-v1"
}