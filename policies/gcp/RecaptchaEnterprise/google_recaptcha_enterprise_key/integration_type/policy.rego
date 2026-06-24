package terraform.gcp.security.recaptchaenterprise.key.integration_type
import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.key.vars

conditions := [
  [
    {
      "situation_description": "integration_type must be 'SCORE' for web keys",
      "remedies": ["Set web_settings.integration_type to 'SCORE'"]
    },
    {
      "condition": "Whitelist approved integration_type value",
      "attribute_path": ["web_settings", 0, "integration_type"],
      "values": ["SCORE"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
