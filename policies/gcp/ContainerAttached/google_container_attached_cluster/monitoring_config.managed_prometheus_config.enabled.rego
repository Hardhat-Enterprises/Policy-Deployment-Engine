package terraform.gcp.security.container_attached.google_container_attached_cluster.monitoring_config_managed_prometheus_config_enabled

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "Managed Prometheus monitoring is disabled. This results in a lack of observability and prevents proactive threat detection.",
            "remedies": [
                "Set monitoring_config.managed_prometheus_config.enabled to true.",
                "Ensure the GKE Hub API and Monitoring API are enabled in the fleet project."
            ]
        },
        {
            "condition": "Check if managed_prometheus_config.enabled is true",
            "attribute_path": ["monitoring_config", 0, "managed_prometheus_config", 0, "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
