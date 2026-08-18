package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.annotations

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

# Merged `annotations`-scoped policy. Each element of `conditions` is an
# independent scenario evaluated on its own by helpers.get_multi_summary:
#   1. annotations_data_classification - approved data_classification values
#   2. annotations_environment         - approved environment values
conditions := [
    [
    {"situation_description" : "Cloud Build v2 repository does not use an approved data classification annotation",
    "remedies":["Set annotations.data_classification to public, internal, confidential, or restricted"]},
    {
        "condition": "Allow only approved data classification annotation values",
        "attribute_path" : ["annotations", "data_classification"],
        "values" : ["public","internal","confidential","restricted"],
        "policy_type" : "whitelist"
    }
    ],
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
