package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.annotations_data_classification

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

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
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details