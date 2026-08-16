package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.web_settings_challenge_security_preference
import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
  [
    {
      "situation_description": "challenge_security_preference is not set to BALANCE or SECURITY (weak/usability-only challenge settings reduce bot resistance)",
      "remedies": [
        "Set web_settings.challenge_security_preference to BALANCE for a moderate trade-off between usability and bot resistance",
        "Set web_settings.challenge_security_preference to SECURITY for maximum bot resistance"
      ]
    },
    {
      "condition": "Require challenge_security_preference to be BALANCE or SECURITY (list web_settings[0])",
      "attribute_path": ["web_settings", 0, "challenge_security_preference"],
      "values": ["BALANCE", "SECURITY"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details