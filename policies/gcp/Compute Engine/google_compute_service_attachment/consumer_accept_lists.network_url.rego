package terraform.gcp.security.compute_engine.google_compute_service_attachment.consumer_accept_lists_network_url
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "network_url is left empty",
            "remedies": [
                "Configure network_url with a consumer network url to connect with this service attachment",
            ]
        },
        {
            "condition": "network_url must not be left empty",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["",  null],
            "policy_type": "blacklist"
        }
    ],
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
            "values": ["*//",  [["https:"]]],
            "policy_type": "pattern whitelist"
        },
        {
            "condition": "network_url must be configured and formatted correctly",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["//*",  [["www.googleapis.com"]]],
            "policy_type": "pattern whitelist"
        },
         {
            "condition": "network_url must be configured and formatted correctly",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["www.googleapis.com/*",  [["compute"]]],
            "policy_type": "pattern whitelist"
        },
        {
            "condition": "network_url must be configured and formatted correctly",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["compute/*",  [["v1"]]],
            "policy_type": "pattern whitelist"
        },
        {
            "condition": "network_url must be configured and formatted correctly",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["v1/*",  [["projects"]]],
            "policy_type": "pattern whitelist"
        },
        {
            "condition": "network_url must be configured and formatted correctly",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["*/network",  [["global"]]],
            "policy_type": "pattern whitelist"
        },
        {
            "condition": "network_url must be configured and formatted correctly",
            "attribute_path": ["consumer_accept_lists", 0, "network_url"],
            "values": ["global/*/",  [["networks"]]],
            "policy_type": "pattern whitelist"
        }

    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details