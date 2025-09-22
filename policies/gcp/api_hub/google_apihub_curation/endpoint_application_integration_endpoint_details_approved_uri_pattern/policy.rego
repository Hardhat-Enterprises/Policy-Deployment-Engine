package terraform.gcp.security.api_hub.google_apihub_curation.endpoint_application_integration_endpoint_details_approved_uri_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_curation.vars

conditions := [
    [
    {"situation_description" : "Check application_integration_endpoint_details_approved_uri_pattern fits defined pattern",
    "remedies":[ "Use valid URI pattern"]},
        {
            "condition": "Wrong URI pattern",
            "attribute_path" : ["endpoint",0,"application_integration_endpoint_details",0,"uri"],
            "values" : ["https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute" ],
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := helpers.get_multi_summary(conditions, vars.variables).details