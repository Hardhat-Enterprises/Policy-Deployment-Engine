resource "google_iam_oauth_client_credential" "nc" {
  oauthclient                = "example-client-id"
  location                   = "global"
  oauth_client_credential_id = "gcp23424sdresdfscred!@01a"
  disabled                   = false
  display_name               = "Invalid Credential"
  project                    = "smooth-verve-467716-v1"
}