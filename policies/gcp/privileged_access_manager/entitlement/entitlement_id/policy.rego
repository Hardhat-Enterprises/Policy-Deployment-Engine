package terraform.gcp.security.privileged_access_manager.entitlement.entitlement_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {
            "situation_description": "Entitlement entitlement_id must be 'c123' for Privileged Access Manager entitlements",
            "remedies": ["Change entitlement_id to 'c123'"]
        },
        {
            "condition": "Check if entitlement_id is 'c123'",
            "attribute_path": ["entitlement_id"],
            "values": ["c123"],
            "policy_type": "whitelist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details