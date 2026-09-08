package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.web_settings_allow_all_domains
import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
  [
    {
      "situation_description": "allow_all_domains is true (wildcard usage is unsafe)",
      "remedies": [
        "Set web_settings.allow_all_domains to false",
        "Populate web_settings.allowed_domains with explicit hostnames"
      ]
    },
    {
      "condition": "Disallow wildcarding via allow_all_domains=true (list web_settings[0])",
      "attribute_path": ["web_settings", 0, "allow_all_domains"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
