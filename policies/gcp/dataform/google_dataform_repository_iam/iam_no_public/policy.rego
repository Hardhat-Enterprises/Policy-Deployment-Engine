package terraform.gcp.security.dataform.google_dataform_repository_iam.iam_no_public

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_iam.vars

conditions := [
    [
        {"situation_description" : "Repository IAM bindings must not include allUsers",
        "remedies": ["Remove allUsers from members"]},
        {
            "condition": "Disallow allUsers member",
            "attribute_path" : ["members"],
            "values" : ["allUsers"],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


