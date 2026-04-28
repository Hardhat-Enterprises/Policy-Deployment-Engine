package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.project_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

conditions := [
    [
    {"situation_description" : "Cloud Build v2 repository is created in an unapproved project",
    "remedies":["Create the repository only in approved GCP projects"]},
    {
        "condition": "Allow only approved projects",
        "attribute_path" : ["project"],
        "values" : ["c"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details