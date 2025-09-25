package terraform.gcp.security.privileged_access_manager.entitlement.requester_justification_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {"situation_description" : "Requester justification config is not properly configured - should not use unstructured or optional configuration",
        "remedies":["Use a structured justification format instead of unstructured", "Make justification mandatory for security compliance"]},
        {
            "condition": "Check if requester_justification_config uses not_mandatory format",
            "attribute_path" : ["requester_justification_config", 0, "not_mandatory"],
            "values" : ["unstructured"],  
            "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details