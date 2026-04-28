package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.parent_connection_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

conditions := [
    [
    {"situation_description" : "Cloud Build v2 repository is using an unapproved parent connection",
    "remedies":["Use only approved Cloud Build v2 parent connections"]},
    {
        "condition": "Allow only approved parent connections",
        "attribute_path" : ["parent_connection"],
        "values" : ["my-connection","secure-connection","prod-connection"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details