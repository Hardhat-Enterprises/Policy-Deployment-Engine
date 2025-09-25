package terraform.gcp.security.firebase_app_hosting.backend.serving_locality

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_hosting.backend.vars

conditions := [
    [
    {"situation_description" : "Backend is using global access which may violate data residency requirements",
    "remedies":[ "Set serving_locality to REGIONAL_STRICT for data residency compliance","Review business requirements for global vs regional serving"]},
    {
        "condition": "Serving locality should be regional for compliance",
        "attribute_path" : ["serving_locality"],
        "values" : ["REGIONAL_STRICT"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details