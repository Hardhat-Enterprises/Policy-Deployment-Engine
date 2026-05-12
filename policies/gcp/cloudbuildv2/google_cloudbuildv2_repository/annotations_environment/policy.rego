package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.annotations_environment

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

conditions := [
    [
    {"situation_description" : "Cloud Build v2 repository does not use an approved environment annotation",
    "remedies":["Set annotations.environment to dev, test, staging, or prod"]},
    {
        "condition": "Allow only approved environment values",
        "attribute_path" : ["annotations","environment"],
        "values" : ["dev","test","staging","prod"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details