resource "google_iam_oauth_client_credential" "nc" {
  oauthclient                = "example-client-id"
  location                   = "australia-southeast1"
  oauth_client_credential_id = "cred02"
  display_name               = "Invalid Credential"
  project                    = "smooth-verve-467716-v1"
}