package terraform.gcp.security.cloud_dns.google_dns_policy.forwarding_path

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_policy.vars

conditions := [
    [
        {
            "situation_description": "The DNS policy forwarding path is not set to private. When set to default, Cloud DNS may forward queries to the public internet for non-RFC1918 addresses, exposing internal DNS queries to external name servers.",
            "remedies": [
                "Set forwarding_path to 'private' in the target_name_servers block.",
                "Using private forwarding ensures all DNS queries are routed through the VPC regardless of IP address range.",
                "Consult Google Cloud DNS documentation for forwarding path configuration."
            ]
        },
        {
            "condition": "Check if forwarding_path is not set to private",
            "attribute_path": ["alternative_name_server_config", 0, "target_name_servers", 0, "forwarding_path"],
            "values": ["private"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details