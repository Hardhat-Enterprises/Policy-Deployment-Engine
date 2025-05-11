# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_oauth_client" "c" {
  oauth_client_id = "oc-c"
  display_name              = "Display Name of OAuth client"
  description               = "A sample OAuth client"
  location                  = "global"
  disabled                  = false
  allowed_grant_types       = ["AUTHORIZATION_CODE_GRANT", "REFRESH_TOKEN_GRANT"]
  allowed_redirect_uris     = ["https://www.compliant.com", "https://www.org.com"]
  allowed_scopes            = ["openid", "email"]
  client_type               = "CONFIDENTIAL_CLIENT"
  project = "id"
}