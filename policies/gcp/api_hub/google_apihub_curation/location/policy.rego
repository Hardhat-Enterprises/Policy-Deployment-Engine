package terraform.gcp.security.api_hub.google_apihub_curation.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_curation.vars

conditions := [
    [
    {"situation_description" : "Check application_integration_endpoint_details fits defined patterns",
    "remedies":[ "Use valid settings to fit patterns"]},
    {
        "condition": "Trigger ID not approved",
        "attribute_path" : ["location",],
        "values" : ["api_trigger/curation_API_PDE_", ["1","2","3"]],
        "policy_type" : "pattern whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := helpers.get_multi_summary(conditions, vars.variables).details