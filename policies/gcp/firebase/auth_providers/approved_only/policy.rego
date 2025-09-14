package terraform.gcp.security.firebase.auth_providers.approved_only

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.auth_providers.vars

conditions := [
    [
    {
        "situation_description" : "Authentication provider is not approved",
        "remedies":[ "Restrict Firebase authentication to approved providers only (e.g., Google, GitHub)" ]
    },
    {
        "condition": "Check if provider_id is in the approved list",
        "attribute_path" : ["provider_id"],
        "values" : ["google.com", "github.com"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
