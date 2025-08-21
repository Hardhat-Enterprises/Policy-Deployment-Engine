package terraform.gcp.security.api_hub.google_apihub_curation.endpoint_application_integration_endpoint_details

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_curation.vars

conditions := [
    [
    {"situation_description" : "Check application_integration_endpoint_details fits a defined URI pattern",
    "remedies":[ "Fix URI to fit pattern"]},
    {
        "condition": "Wrong URI pattern",
        "attribute_path" : ["endpoint", "application_integration_endpoint_details"],
        "values" : ["https://integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute", "https://{location}-integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute" ],
        "policy_type" : "pattern whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := helpers.get_multi_summary(conditions, vars.variables).details