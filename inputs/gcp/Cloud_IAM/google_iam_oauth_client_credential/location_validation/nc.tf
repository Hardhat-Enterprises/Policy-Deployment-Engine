resource "google_iam_oauth_client" "client_nc" {
  oauth_client_id       = "example-client-id"
  display_name          = "Invalid OAuth Client"
  location              = "global"
  project               = "smooth-verve-467716-v1"
  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://www.example.com"]
  allowed_scopes        = ["https://www.googleapis.com/auth/cloud-platform"]
  client_type           = "CONFIDENTIAL_CLIENT"
}

resource "google_iam_oauth_client_credential" "nc" {
  oauthclient                = google_iam_oauth_client.client_nc.oauth_client_id
  location                   = "global"
  oauth_client_credential_id = "gcp-cred-01a"
  display_name               = "Invalid Credential"
  project = "smooth-verve-467716-v1"  
}