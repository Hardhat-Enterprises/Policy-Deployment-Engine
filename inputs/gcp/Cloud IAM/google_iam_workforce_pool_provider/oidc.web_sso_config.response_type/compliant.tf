resource "google_iam_workforce_pool_provider" "compliant_example_1" {
  workforce_pool_id = "example-workforce-pool"
  provider_id       = "code-flow-provider-good"
  location          = "global"

  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }

  oidc {
    issuer_uri = "https://accounts.example.com"
    client_id  = "example-client-id"

    client_secret {
      value {
        plain_text = "example-client-secret"
      }
    }

    web_sso_config {
      assertion_claims_behavior = "ONLY_ID_TOKEN_CLAIMS"
      response_type             = "CODE"
    }
  }
}
