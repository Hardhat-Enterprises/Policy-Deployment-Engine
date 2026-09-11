package terraform.gcp.security.dialogflow.google_dialogflow_fulfillment.generic_web_service_username

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow.google_dialogflow_fulfillment.vars

conditions := [
    [
        {
            "situation_description": "A static username is configured for the Dialogflow web service.",
            "remedies": [
                "Remove the static username from generic_web_service and use a stronger identity-based authentication method."
            ]
        },
        {
            "condition": "Check that generic_web_service.username is not configured.",
            "attribute_path": ["generic_web_service",0, "username"],
            "values": ["", null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details