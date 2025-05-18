package terraform.gcp.security.kuber_engine.google_container_cluster.Private_cluster_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
    [
        {"situation_description" : "Cluster master is globally accessible, which may introduce security risks.",
         "remedies": ["Disable master_global_access_config or set enabled = false"]},
        {
            "condition": "master_global_access_config.enabled should be false",
            "attribute_path": ["private_cluster_config", 0, "master_global_access_config", 0, "enabled"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
