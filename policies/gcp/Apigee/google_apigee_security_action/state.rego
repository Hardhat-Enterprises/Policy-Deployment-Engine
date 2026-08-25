package terraform.gcp.security.apigee.google_apigee_security_action.state

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_security_action.vars

conditions := [
    [
        {
            "situation_description": "The Apigee security action is disabled and therefore does not apply its configured protection to matching API traffic.",
            "remedies": [
                "Set state to ENABLED.",
                "Confirm that the action conditions and behaviour are correct before enabling it.",
                "Investigate why the security action was disabled."
            ]
        },
        {
            "condition": "Check whether the security action is enabled.",
            "attribute_path": [
                "state"
            ],
            "values": [
                "ENABLED"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
