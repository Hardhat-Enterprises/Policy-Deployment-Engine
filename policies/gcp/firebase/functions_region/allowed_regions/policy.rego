package terraform.gcp.security.firebase.functions_region.allowed_regions

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.functions_region.vars

conditions := [
    [
    {
        "situation_description" : "Firebase function is deployed in a disallowed region",
        "remedies":[ "Deploy the function only in approved regions (e.g., us-central1, europe-west1)" ]
    },
    {
        "condition": "Check if function region is in the allowed list",
        "attribute_path" : ["region"],
        "values" : ["us-central1", "europe-west1"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
