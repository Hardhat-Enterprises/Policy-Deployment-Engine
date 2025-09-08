package terraform.gcp.security.privileged_access_manager.entitlement.requester_justification_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {"situation_description": "Requester justification is not configured or is set to not mandatory",
         "remedies": ["Configure requester_justification_config with 'unstructured{}' to require justification"]},
        {
            "condition": "Check if justification config is missing or set to not mandatory",
            "attribute_path": ["requester_justification_config"],
            "values": [null, {"not_mandatory": {}}],
            "policy_type": "blacklist"
        }
    ],
    [
        {"situation_description": "Requester justification should be properly configured with unstructured method",
         "remedies": ["Use 'unstructured{}' in requester_justification_config to require free-text justification"]},
        {
            "condition": "Check if unstructured justification is NOT configured",
            "attribute_path": ["requester_justification_config", "unstructured"],
            "values": [null],
            "policy_type": "whitelist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details