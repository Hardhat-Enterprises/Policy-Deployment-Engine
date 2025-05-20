package terraform.gcp.security.kuber_engine.google_container_cluster.gke_security_observability

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars


conditions := [

    [
        {"situation_description": "Logging is not configured properly (missing SYSTEM_COMPONENTS or APISERVER)",
        "remedies": ["Enable SYSTEM_COMPONENTS and APISERVER in logging_config"]},
        {
            "condition": "Ensure logging_config includes SYSTEM_COMPONENTS and APISERVER",
            "attribute_path": ["logging_config", 0, "enable_components"],
            "values": ["SYSTEM_COMPONENTS", "APISERVER"],
            "policy_type": "whitelist"
        }
    ],

    [
        {"situation_description": "Monitoring is missing SYSTEM_COMPONENTS, APISERVER or CONTROLLER_MANAGER",
        "remedies": ["Enable SYSTEM_COMPONENTS, APISERVER, and CONTROLLER_MANAGER in monitoring_config"]},
        {
            "condition": "Ensure monitoring_config includes required components",
            "attribute_path": ["monitoring_config", 0, "enable_components"],
            "values": ["SYSTEM_COMPONENTS", "APISERVER", "CONTROLLER_MANAGER"],
            "policy_type": "whitelist"
        }
    ],

    [
        {"situation_description": "Binary Authorization is not enforced",
        "remedies": ["Set evaluation_mode to PROJECT_SINGLETON_POLICY_ENFORCE"]},
        {
            "condition": "Ensure binary_authorization is enforced",
            "attribute_path": ["binary_authorization", 0, "evaluation_mode"],
            "values": ["PROJECT_SINGLETON_POLICY_ENFORCE"],
            "policy_type": "whitelist"
        }
    ],

    [
        {"situation_description": "Workload Identity Pool is misconfigured",
        "remedies": ["Set workload_pool to a valid value like <project_id>.svc.id.goog"]},
        {
            "condition": "Ensure workload_identity_config uses valid workload pool",
            "attribute_path": ["workload_identity_config", 0, "workload_pool"],
            "values": [["endsWith", ".svc.id.goog"]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
