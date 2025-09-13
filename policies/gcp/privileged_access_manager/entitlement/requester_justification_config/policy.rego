package terraform.gcp.security.privileged_access_manager.entitlement.requester_justification_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {"situation_description": "Requester justification configuration is missing entirely",
         "remedies": ["Add requester_justification_config block with either 'unstructured{}' or 'not_mandatory{}'"]},
        {
            "condition": "Check if requester_justification_config is missing",
            "attribute_path": ["requester_justification_config"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {"situation_description": "Requester justification is configured but neither unstructured nor not_mandatory is specified",
         "remedies": ["Specify either 'unstructured{}' to require justification or 'not_mandatory{}' to make it optional"]},
        {
            "condition": "Check if requester_justification_config exists but has no valid sub-configuration",
            "attribute_path": ["requester_justification_config"],
            "values": [{}],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details