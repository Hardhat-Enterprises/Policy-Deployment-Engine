package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection_iam_member.vars

conditions := [
    [
    {"situation_description" : "Prevent public access to Cloud Build v2 connection IAM member",
    "remedies":["Remove allUsers and allAuthenticatedUsers from IAM member"]},
    {
        "condition": "Block public IAM members",
        "attribute_path" : ["member"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details