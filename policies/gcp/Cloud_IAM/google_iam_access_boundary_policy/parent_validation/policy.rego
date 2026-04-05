package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.parent_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.parent_validation.vars

conditions := [

    [
        {
            "situation_description": "Parent is not properly defined or not URL encoded",
            "remedies": [
                "Ensure parent uses URL-encoded format",
                "Use format: cloudresourcemanager.googleapis.com/projects/<project_id>"
            ]
        },
        {
            "condition": "Validate parent format",
            "attribute_path": ["parent"],
            "values": ["cloudresourcemanager.googleapis.com/projects/*"],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details