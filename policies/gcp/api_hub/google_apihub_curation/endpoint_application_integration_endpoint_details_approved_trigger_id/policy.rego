package terraform.gcp.security.api_hub.google_apihub_curation.endpoint_application_integration_endpoint_details_approved_trigger_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_curation.vars

conditions := [
    [
    {"situation_description" : "Check application_integration_endpoint_details_approved_trigger_id fits defined patterns",
    "remedies":[ "Use valid settings for Trigger ID to fit patterns"]},
        {
            "condition": "Trigger ID not approved",
            "attribute_path" : ["endpoint",0,"application_integration_endpoint_details",0,"trigger_id"],
            "values" : ["api_trigger/curation_API_PDE*", [["1", "2", "3"]]],
            "policy_type" : "pattern whitelist"
        }
    ],
    [
    {"situation_description" : "input RANDOM_9999 or api_trigger/aaaa not allowed",
    "remedies":[ "Use valid settings for Trigger ID to fit patterns"]},
        {
            "condition": "Trigger ID not approved",
            "attribute_path" : ["endpoint",0,"application_integration_endpoint_details",0,"trigger_id"],
            "values" : ["RANDOM_9999", "", "api_trigger/aaaa"],
            "policy_type" : "blacklist"
        },
    ],
    [
    {"situation_description" : "input api_trigger/curation_API_* not allowed",
    "remedies":[ "Use valid settings for Trigger ID to fit patterns"]},
        {
            "condition": "Trigger ID not approved",
            "attribute_path" : ["endpoint",0,"application_integration_endpoint_details",0,"trigger_id"],
            "values" : ["api_trigger/curation_API_*",[["1","2","3"]]],
            "policy_type" : "pattern blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details