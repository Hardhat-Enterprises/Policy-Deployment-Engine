package terraform.gcp.security.compute_engine.google_compute_service_attachment.enable_proxy_protocol # Edit here 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "enable_proxy_protocol is not congiured to true",
            "remedies": [
                "Configure enable_proxy_protocol to true",
            ]
        },
        {
            "condition": "enable_proxy_protocol must be set to true",
            "attribute_path": ["enable_proxy_protocol"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details