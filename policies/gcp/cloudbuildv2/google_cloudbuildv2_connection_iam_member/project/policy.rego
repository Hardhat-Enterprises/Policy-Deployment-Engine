package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection_iam_member.project

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection_iam_member.vars

conditions := [
    [
    {"situation_description" : "Restrict usage to approved project",
    "remedies":["Use approved project only"]},
    {
        "condition": "Allow only approved project",
        "attribute_path" : ["project"],
        "values" : ["c"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details