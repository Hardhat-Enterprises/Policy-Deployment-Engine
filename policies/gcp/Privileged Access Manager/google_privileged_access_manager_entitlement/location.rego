package terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.location
import data.terraform.helpers
import data.terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.vars

conditions := [
    [
        {
            "situation_description": "Entitlement location must be 'global' for Privileged Access Manager entitlements",
            "remedies": ["Change location to 'global'"]
        },
        {
            "condition": "Check if entitlement location is 'global'",
            "attribute_path": ["location"],
            "values": ["global"],
            "policy_type": "whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details