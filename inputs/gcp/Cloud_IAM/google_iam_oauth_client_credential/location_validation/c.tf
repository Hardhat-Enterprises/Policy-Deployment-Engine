resource "google_iam_oauth_client_credential" "c" {
  oauthclient                = "example-client-id"
  location                   = "global"
  oauth_client_credential_id = "c"
  display_name               = "Valid Credential"
  project                    = "smooth-verve-467716-v1"
}