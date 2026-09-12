package terraform.gcp.security.compute_engine.google_compute_service_attachment.propagated_connection_limit 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "propagated_connection_limit is configured to too high of a limit",
            "remedies": [
                "Configure propagated_connection_limit to be within 0 and 50",
            ]
        },
        {
            "condition": "propagated_connection_limit must be configured to be under 50",
            "attribute_path": ["propagated_connection_limit"],
            "values": [0, 15],
            "policy_type": "range"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details