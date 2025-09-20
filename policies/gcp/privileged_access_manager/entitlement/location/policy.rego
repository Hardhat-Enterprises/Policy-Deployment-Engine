package terraform.gcp.security.privileged_access_manager.entitlement.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

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


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details