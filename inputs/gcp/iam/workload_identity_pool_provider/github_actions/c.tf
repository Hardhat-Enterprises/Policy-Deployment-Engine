# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_workload_identity_pool_provider" "c" {
  workload_identity_pool_id          = "pid"
  workload_identity_pool_provider_id = "wipp-c"
  project = "project-id"
  display_name                       = "Name of provider"
  description                        = "GitHub Actions identity pool provider for automated test"
  disabled                           = true
  attribute_condition = <<EOT
    assertion.repository_owner_id == "123456789" &&
    attribute.repository == "gh-org/gh-repo" &&
    assertion.ref == "refs/heads/main" &&
    assertion.ref_type == "branch"
EOT
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}
