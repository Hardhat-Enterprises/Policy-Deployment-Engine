package terraform.gcp.security.privileged_access_manager.entitlement.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars


conditions := [
    [
        {
            "situation_description": "Entitlement location is not in the approved Australia regions",
            "remedies": ["Change location to 'australia-southeast1' or 'australia-southeast2'"]
        },
        {
            "condition": "Check if entitlement location is not compliant",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
