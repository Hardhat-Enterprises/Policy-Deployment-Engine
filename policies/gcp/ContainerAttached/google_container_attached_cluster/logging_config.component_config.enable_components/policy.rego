package terraform.gcp.security.container_attached.google_container_attached_cluster.logging_config_component_config_enable_components

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "Required logging components (SYSTEM_COMPONENTS or WORKLOADS) are missing. This reduces visibility into cluster health and security events.",
            "remedies": [
                "Add 'SYSTEM_COMPONENTS' to logging_config.component_config.enable_components.",
                "Ensure logging_config is explicitly defined in your Terraform resource."
            ]
        },
        {
            "condition": "Check if required logging components are enabled",
            "attribute_path": ["logging_config", 0,  "component_config", 0,  "enable_components"],
            "values": "SYSTEM_COMPONENTS",
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
