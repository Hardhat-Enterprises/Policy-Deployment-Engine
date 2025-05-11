# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_oauth_client" "nc" {
  oauth_client_id = "oc-nc"
  display_name              = "Display Name of OAuth client"
  description               = "A sample OAuth client"
  location                  = "global"
  disabled                  = false
  allowed_grant_types       = ["GRANT_TYPE_UNSPECIFIED"]
  allowed_redirect_uris     = ["https://www.non-compliant.com", "https://www.org.com"]
  allowed_scopes            = ["https://www.googleapis.com/auth/cloud-platform"]
  client_type               = "PUBLIC_CLIENT"
  project = "id"
}