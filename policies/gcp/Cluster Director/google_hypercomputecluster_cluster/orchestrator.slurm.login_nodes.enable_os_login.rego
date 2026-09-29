package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.orchestrator_slurm_login_nodes_enable_os_login

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Slurm login nodes should use OS Login for centralized SSH access control.",
        "remedies": ["Set orchestrator.slurm.login_nodes.enable_os_login to true."],
    },
    {
        "condition": "OS Login must be enabled on login nodes",
        "attribute_path": ["orchestrator", 0, "slurm", 0, "login_nodes", 0, "enable_os_login"],
        "values": [true],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details