package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.cluster_operations_enable_application_logs

import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars

conditions := [
    [
        {
            "situation_description": "Bare Metal Admin Cluster must collect application logs/metrics for security visibility.",
            "remedies": [
                "Set cluster_operations.enable_application_logs to true.",
                "Without application-level logging, the cluster lacks the audit/visibility trail needed to detect or investigate anomalous workload behaviour - only system logs/metrics are collected by default."
            ]
        },
        {
            "condition": "cluster_operations.enable_application_logs must be true",
            "attribute_path": ["cluster_operations", 0, "enable_application_logs"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
