package terraform.gcp.security.dialogflow.google_dialogflow_fulfillment.generic_web_service_password

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow.google_dialogflow_fulfillment.vars

conditions := [
    [
        {
            "situation_description": "A static password is configured for the Dialogflow web service.",
            "remedies": [
                "Remove the static password from generic_web_service and use a stronger identity-based authentication method."
            ]
        },
        {
            "condition": "Check that generic_web_service.password is not configured.",
            "attribute_path": ["generic_web_service",0, "password"],
            "values": ["", null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details