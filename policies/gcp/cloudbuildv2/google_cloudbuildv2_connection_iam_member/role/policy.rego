package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection_iam_member.vars

conditions := [
    [
    {"situation_description" : "Prevent overly permissive IAM roles",
    "remedies":["Remove roles/editor and roles/owner. Use least privilege roles such as roles/cloudbuild.connectionViewer"]},
    {
        "condition": "Block overly permissive IAM roles",
        "attribute_path" : ["role"],
        "values" : ["roles/editor", "roles/owner"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details