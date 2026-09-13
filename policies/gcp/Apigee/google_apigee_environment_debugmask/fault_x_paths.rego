package terraform.gcp.security.apigee.google_apigee_environment_debugmask.fault_x_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask has no fault-message XPath expressions configured, so sensitive XML values may appear unmasked in debug output.",
            "remedies": [
                "Configure at least one XPath expression in fault_x_paths.",
                "Select XPath expressions appropriate for the API fault-message schema.",
                "Include paths covering credentials, tokens, personal information, and other sensitive values."
            ]
        },
        {
            "condition": "Check whether at least one fault-message XPath expression is configured.",
            "attribute_path": [
                "fault_x_paths"
            ],
            "values": [
                null,
                []
            ],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
