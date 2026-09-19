package terraform.gcp.security.compute_engine.google_compute_service_attachment.consumer_accept_lists_network_url
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "network_url is not configured correctly",
            "remedies": [
                "Configure network_url with a consumer network url format to connect with this service attachment",
            ]
        },
        {
            "condition": "network_url must be configured and formatted correctly",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["https://www.googleapis.com/compute/v1/projects/*/global/networks/*",  [["projectid", "my-project"],["networkid", "my-network"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details