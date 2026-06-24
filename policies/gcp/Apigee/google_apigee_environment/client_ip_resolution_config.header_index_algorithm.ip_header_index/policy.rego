package terraform.gcp.security.apigee.google_apigee_environment.client_ip_resolution_config_header_index_algorithm_ip_header_index
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment.vars

conditions := [
    [
        {
            "situation_description": "client_ip_resolution_config is not using a safe ip_header_index — a non-negative index allows clients to spoof their IP address via X-Forwarded-For header injection",
            "remedies": [
                "Set 'ip_header_index' to -1 to always use the last verified hop in the X-Forwarded-For header",
                "Avoid using index 0 or other positive indices as these can be spoofed by the client"
            ]
        },
        {
            "condition": "Check that ip_header_index is set to -1 to use the last trusted IP in X-Forwarded-For",
            "attribute_path": ["client_ip_resolution_config", 0, "header_index_algorithm", 0, "ip_header_index"],
            "values": [-1],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
