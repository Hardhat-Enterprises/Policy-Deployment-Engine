package terraform.gcp.security.cloud_dns.google_dns_response_policy.required_description

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_response_policy.vars

conditions := [
    [
        {
            "situation_description": "The DNS response policy is using the default Terraform description. All response policies must have a meaningful description for audit and security traceability.",
            "remedies": [
                "Add a meaningful description field to the google_dns_response_policy resource.",
                "Do not use the default 'Managed by Terraform' description.",
                "Consult Google Cloud DNS documentation for response policy best practices."
            ]
        },
        {
            "condition": "Check if description is the default Terraform value",
            "attribute_path": ["description"],
            "values": ["Managed by Terraform"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details