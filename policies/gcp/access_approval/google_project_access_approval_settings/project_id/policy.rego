package terraform.gcp.security.access_approval.google_project_access_approval_settings.project_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_approval.google_project_access_approval_settings.vars

conditions := [
    [
    {"situation_description" : "Ensure project id provided",
    "remedies":["Set project_id to PDE"]},
    {
        "condition": "Validating project id",
        "attribute_path" : ["project_id"], 
        "values" : ["PDE"], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details