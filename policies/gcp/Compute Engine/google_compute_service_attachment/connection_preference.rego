package terraform.gcp.security.compute_engine.google_compute_service_attachment.connection_preference 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "connection_preference is not configured correctly and set to ACCEPT_AUTOMATIC",
            "remedies": [
                "Configure connection_preference to ACCEPT_MANUAL",
            ]
        },
        {
            "condition": "connection_preference must be configured to ACCEPT_MANUAL",
            "attribute_path": ["connection_preference"],
            "values": ["ACCEPT_MANUAL"],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details