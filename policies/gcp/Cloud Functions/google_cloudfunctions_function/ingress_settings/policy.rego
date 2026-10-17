package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.ingress_settings
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Cloud Function ingress should be restricted to internal traffic only",
    "remedies":[ "Change ingress setting to ALLOW_INTERNAL_ONLY"]
    },
    {
        "condition": "Test whether traffic is only reaching internal networks",
        "attribute_path" : ["ingress_settings"],
        "values" : ["ALLOW_INTERNAL_AND_GCLB", "ALLOW_ALL"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details