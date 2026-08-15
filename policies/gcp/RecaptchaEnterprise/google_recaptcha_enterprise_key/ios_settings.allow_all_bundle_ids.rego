package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.ios_settings_allow_all_bundle_ids

import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
    [
        {
            "situation_description": "ios_settings.allow_all_bundle_ids is true, so allowed_bundle_ids is not enforced and any iOS app can use the key.",
            "remedies": [
                "Set ios_settings.allow_all_bundle_ids to false.",
                "Populate ios_settings.allowed_bundle_ids with the specific, approved bundle IDs."
            ]
        },
        {
            "condition": "Disallow allow_all_bundle_ids=true",
            "attribute_path": ["ios_settings", 0, "allow_all_bundle_ids"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details