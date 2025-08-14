package terraform.gcp.security.access_approval.google_organization_access_approval_settings.organization_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_approval.google_organization_access_approval_settings.vars

conditions := [
    [
    {"situation_description" : "Ensure organization id provided",
    "remedies":["Set organization_id to Hardhat"]},
    {
        "condition": "Validating organization id",
        "attribute_path" : ["organization_id"], 
        "values" : ["Hardhat"], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details