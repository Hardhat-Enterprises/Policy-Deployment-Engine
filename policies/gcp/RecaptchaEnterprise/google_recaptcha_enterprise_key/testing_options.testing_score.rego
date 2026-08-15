package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.testing_options_testing_score

import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
    [
        {
            "situation_description": "testing_options.testing_score is set to 1, forcing every assessment to appear legitimate and silently disabling bot detection for this key.",
            "remedies": [
                "Remove testing_options from production keys entirely.",
                "If testing is genuinely required, use a lower score to exercise the challenge path instead of forcing every assessment to pass."
            ]
        },
        {
            "condition": "Disallow testing_score=1",
            "attribute_path": ["testing_options", 0, "testing_score"],
            "values": [1],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details