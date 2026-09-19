package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.orchestrator_slurm_login_nodes_enable_public_ips

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Slurm login nodes should not be directly exposed using public IP addresses.",
        "remedies": ["Set orchestrator.slurm.login_nodes.enable_public_ips to false."],
    },
    {
        "condition": "Public IP addresses must be disabled on login nodes",
        "attribute_path": ["orchestrator", 0, "slurm", 0, "login_nodes", 0, "enable_public_ips"],
        "values": [false],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details