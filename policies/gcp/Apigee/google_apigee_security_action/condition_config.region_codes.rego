package terraform.gcp.security.apigee.google_apigee_security_action.condition_config_region_codes

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_security_action.vars

conditions := [
    [
        {
            "situation_description": "The Apigee security action targets a geographic region that is not included in the organisation's approved region list.",
            "remedies": [
                "Configure condition_config.region_codes using approved ISO 3166-1 alpha-2 region codes.",
                "Remove region codes that are not approved for this security action.",
                "Review geographic traffic requirements with the security and compliance teams."
            ]
        },
        {
            "condition": "Check whether the security action uses only approved geographic region codes.",
            "attribute_path": [
                "condition_config",
                0,
                "region_codes"
            ],
            "values": [
                "AU",
                "NZ"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
