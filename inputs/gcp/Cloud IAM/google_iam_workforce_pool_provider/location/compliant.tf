resource "google_iam_workforce_pool_provider" "compliant_example_1" {
  workforce_pool_id = "example-workforce-pool"
  provider_id       = "location-provider"
  display_name      = "compliant_example_1"
  location          = "global"

  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }

  oidc {
    issuer_uri = "https://accounts.example.com"
    client_id  = "example-client-id"
  }
}
