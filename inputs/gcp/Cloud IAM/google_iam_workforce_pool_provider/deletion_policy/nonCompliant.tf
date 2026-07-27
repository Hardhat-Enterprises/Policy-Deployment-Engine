resource "google_iam_workforce_pool_provider" "non_compliant_example_1" {
  workforce_pool_id = "example-workforce-pool"
  provider_id       = "deletion-provider-bad"
  location          = "global"
  deletion_policy   = "DELETE"

  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }

  oidc {
    issuer_uri = "https://accounts.example.com"
    client_id  = "example-client-id"
  }
}
