package terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.oidc_web_sso_config_response_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.vars

conditions := [
    [
        {
            "situation_description": "The workforce pool provider uses the OIDC Implicit Flow for web sign-in, which exposes tokens through the browser response and is less secure than the Authorization Code Flow.",
            "remedies": [
                "Set 'oidc.web_sso_config.response_type' to 'CODE' and configure an OIDC client secret."
            ]
        },
        {
            "condition": "Check whether web sign-in uses the Authorization Code Flow",
            "attribute_path": ["oidc", 0, "web_sso_config", 0, "response_type"],
            "values": ["CODE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
