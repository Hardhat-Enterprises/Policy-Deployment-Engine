package terraform.gcp.security.compute_engine.google_compute_service_attachment.consumer_accept_lists_network_url
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "network_url is not configured correctly and or left empty",
            "remedies": [
                "Configure network_url with a consumer network url to connect with this service attachment",
            ]
        },
        {
            "condition": "network_url must be configured and not left empty",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["",  null],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details