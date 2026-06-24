package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.web_settings_allow_amp_traffic
import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
  [
    {
      "situation_description": "AMP traffic is enabled for a web key (allow_amp_traffic = true)",
      "remedies": [
        "Set web_settings.allow_amp_traffic to false",
        "Review whether AMP usage is approved for this application"
      ]
    },
    {
      "condition": "Disallow AMP traffic for reCAPTCHA Enterprise web keys",
      "attribute_path": ["web_settings", 0, "allow_amp_traffic"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
