package terraform.gcp.security.identity_platform.google_identity_platform_config.multi_tenant_allow_tenants

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "The project permits tenant creation.",
            "remedies": [
                "Set multi_tenant.allow_tenants to false unless multi-tenancy has been explicitly approved."
            ]
        },
        {
            "condition": "Tenant creation must be disabled",
            "attribute_path": ["multi_tenant",0,"allow_tenants"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
