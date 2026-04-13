resource "google_iam_oauth_client" "client" {
  oauth_client_id       = "example-client-id"
  display_name          = "Invalid OAuth Client"
  description           = "Non-compliant OAuth client"
  location              = "global"
  disabled              = false
  allowed_grant_types   = ["AUTHORIZATION_CODE_GRANT"]
  allowed_redirect_uris = ["https://www.example.com"]
  allowed_scopes        = ["https://www.googleapis.com/auth/cloud-platform"]
  client_type           = "CONFIDENTIAL_CLIENT"
  project               = "smooth-verve-467716-v1"
}

resource "google_iam_oauth_client_credential" "nc" {
  oauthclient                = google_iam_oauth_client.client.oauth_client_id
  location                   = "australia-southeast1"   
  oauth_client_credential_id = "cred-01a"
  disabled                   = false
  display_name               = "Invalid Credential"
}