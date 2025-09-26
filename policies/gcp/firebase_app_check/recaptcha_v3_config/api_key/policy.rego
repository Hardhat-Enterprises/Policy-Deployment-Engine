package terraform.gcp.security.firebase.google_firebase_app_check_recaptcha_v3_config.api_key

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.google_firebase_app_check_recaptcha_v3_config.vars

conditions := [
    [
        {
            "situation_description": "Firebase App Check reCAPTCHA v3 API key is unrestricted, increasing risk of key leakage and abuse.",
            "remedies": ["Restrict the API key to specific services, HTTP referrers, or IP addresses."]
        },
        {
            "condition": "Check if API key is restricted",
            "attribute_path": ["recaptcha_v3_config", 0, "site_secret"],
            "values": ["restricted-api-key-12345"],  # replace with actual allowed keys
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
