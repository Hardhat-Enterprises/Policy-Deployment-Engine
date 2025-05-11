# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_workforce_pool_provider" "nc" {
  workforce_pool_id = "pid"
  location          = "global"
  provider_id       = "wfpp-nc"
  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }
  oidc {
    issuer_uri = "http://loginz.microsoftonline.com/826602fe-2101-470c-9d71-ee1343668989/v2.0"
    client_id  = "client-id"
    client_secret {
      value {
        plain_text = "123"
      }
    }
    web_sso_config {
      response_type             = "ID_TOKEN" 
      assertion_claims_behavior = "ONLY_ID_TOKEN_CLAIMS" 
      additional_scopes         = ["groups", "roles", "openid", "email", "profile", "secrets"]
    }
  }
  extra_attributes_oauth2_client {
    issuer_uri = "https://login.microsoftonline.com/826602fe-2101-470c-9d71-ee1343668989/v2.0"
    client_id  = "client-id"
    client_secret {
      value {
        plain_text = "client-secret"
      }
    }
    attributes_type = "AZURE_AD_GROUPS_MAIL"
    query_parameters {
      filter = "mail:sales"
    }
  }
  display_name        = "Display name"
  description         = "A sample OIDC workforce pool provider."
  disabled            = false
  attribute_condition = "true"
}
