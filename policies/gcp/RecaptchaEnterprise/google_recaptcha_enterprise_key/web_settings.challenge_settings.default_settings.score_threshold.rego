package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.web_settings_challenge_settings_default_settings_score_threshold

import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
    [
        {
            "situation_description": "The default challenge score threshold is set too low, so risky traffic that does not match any specific action rule passes unchallenged.",
            "remedies": [
                "Set web_settings.challenge_settings.default_settings.score_threshold to at least 0.5.",
                "A higher default threshold means more borderline traffic is challenged rather than silently waved through."
            ]
        },
        {
            "condition": "Check default score_threshold is within the approved range",
            "attribute_path": ["web_settings", 0, "challenge_settings", 0, "default_settings", 0, "score_threshold"],
            "values": [0.5, 1],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details