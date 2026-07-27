resource "google_iam_workforce_pool_provider" "compliant_example_1" {
  workforce_pool_id   = "example-workforce-pool"
  provider_id         = "condition-provider-good"
  location            = "global"
  attribute_condition = "assertion.sub != \"\""

  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }

  oidc {
    issuer_uri = "https://accounts.example.com"
    client_id  = "example-client-id"
  }
}
