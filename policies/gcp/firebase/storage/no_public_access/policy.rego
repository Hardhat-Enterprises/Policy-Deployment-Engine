package terraform.gcp.security.firebase.storage.no_public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.storage.vars

conditions := [
    [
    {
        "situation_description" : "Storage bucket allows public access",
        "remedies":[ "Restrict bucket IAM policies to authorized users only" ]
    },
    {
        "condition": "Check if bucket IAM member is public",
        "attribute_path" : ["values", "member"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
