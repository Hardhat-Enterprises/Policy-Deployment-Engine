package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.testing_options_testing_challenge

import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
    [
        {
            "situation_description": "testing_options.testing_challenge is set to NOCAPTCHA, making every challenge request auto-pass and silently disabling bot detection for this key.",
            "remedies": [
                "Remove testing_options from production keys entirely.",
                "If testing is genuinely required, use UNSOLVABLE_CHALLENGE instead of NOCAPTCHA."
            ]
        },
        {
            "condition": "Disallow testing_challenge=NOCAPTCHA",
            "attribute_path": ["testing_options", 0, "testing_challenge"],
            "values": ["NOCAPTCHA"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details