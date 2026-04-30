package terraform.gcp.security.apigee.google_apigee_organization.apigee_organization_runtime_type

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization runtime_type is set to HYBRID which runs Apigee on customer-managed infrastructure and increases security risk",
            "remedies": [
                "Set runtime_type to CLOUD to use Google-managed infrastructure",
                "HYBRID should only be used when explicitly required and with additional security controls"
            ]
        },
        {
            "condition": "Check if runtime_type is not HYBRID",
            "attribute_path": ["runtime_type"],
            "values": ["HYBRID"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
