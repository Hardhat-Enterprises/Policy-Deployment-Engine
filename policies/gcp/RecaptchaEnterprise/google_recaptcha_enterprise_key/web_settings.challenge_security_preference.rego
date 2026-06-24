package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.web_settings_challenge_security_preference
import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
  [
    {
      "situation_description": "challenge_security_preference must be 'BALANCE' for web keys",
      "remedies": ["Set web_settings.challenge_security_preference to 'BALANCE'"]
    },
    {
      "condition": "Whitelist approved challenge_security_preference value",
      "attribute_path": ["web_settings", 0, "challenge_security_preference"],
      "values": ["BALANCE"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
