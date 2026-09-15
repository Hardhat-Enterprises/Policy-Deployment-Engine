package terraform.gcp.security.dialogflow.google_dialogflow_fulfillment.generic_web_service_uri

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow.google_dialogflow_fulfillment.vars

conditions := [
    [
        {
            "situation_description": "The Dialogflow web service URI does not use HTTPS.",
            "remedies": [
                "Configure generic_web_service.uri to use the HTTPS protocol."
            ]
        },
        {
            "condition": "Check that generic_web_service.uri begins with https://.",
            "attribute_path": ["generic_web_service",0, "uri"],
            "values": ["*://", [["https"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details