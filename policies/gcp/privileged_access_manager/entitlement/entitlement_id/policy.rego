package terraform.gcp.security.privileged_access_manager.entitlement.entitlement_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
    {"situation_description" : "Entitlement ID does not follow naming requirements",
    "remedies":[ "Use 4-63 characters with only lowercase letters a-z, numbers 0-9, and hyphens", "Start with a lowercase letter", "Ensure the ID is unique within the parent scope"]},
    {
        "condition": "Test if entitlement_id follows proper naming convention",
        "attribute_path" : ["entitlement_id"],
        "values" : ["^[a-z][a-z0-9-]{3,62}$"],
        "policy_type" : "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details