# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_workload_identity_pool_provider" "nc" {
  workload_identity_pool_id          = "pid"
  workload_identity_pool_provider_id = "wipp-nc"
  project = "project-id"
  display_name                       = "Name of provider"
  description                        = "GitHub Actions identity pool provider for automated test"
  disabled                           = true
  attribute_condition = "true"
  attribute_mapping = {
    "google.subject"       = "as"
    "attribute.actor"      = "astor"
    "attribute.aud"        = "assaud"
    "attribute.repository" = "astory"
  }
  oidc {
    issuer_uri = "http://token.actions.githubusercontent.com"
  }
}