package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.location

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

conditions := [
    [
    {"situation_description" : "Restrict Cloud Build v2 repository location to Australia",
    "remedies":["Use australia-southeast1 or australia-southeast2"]},
    {
        "condition": "Allow only Australian regions",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1","australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details