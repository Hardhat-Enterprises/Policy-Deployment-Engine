package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.android_settings_allow_all_package_names

import data.terraform.helpers
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

conditions := [
    [
        {
            "situation_description": "android_settings.allow_all_package_names is true, so allowed_package_names is not enforced and any Android app can use the key.",
            "remedies": [
                "Set android_settings.allow_all_package_names to false.",
                "Populate android_settings.allowed_package_names with the specific, approved package names."
            ]
        },
        {
            "condition": "Disallow allow_all_package_names=true",
            "attribute_path": ["android_settings", 0, "allow_all_package_names"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details