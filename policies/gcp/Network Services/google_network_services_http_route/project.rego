package terraform.gcp.security.network_services.google_network_services_http_route.project

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route does not pin an explicit 'project' value, or pins one outside the approved project whitelist. Without an explicit, approved project, Terraform falls back to the provider's default project, which can place the route outside intended security boundaries or monitoring scope.",
            "remedies": [
                "Set 'project' explicitly to an approved project ID rather than relying on the provider default.",
                "Ensure the project ID matches one from the organisation's approved project whitelist."
            ]
        },
        {
            "condition": "Check if project is set to an approved value",
            "attribute_path": ["project"],
            "values": ["approved-project-1", "approved-project-2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details