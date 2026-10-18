package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.orchestrator_slurm_login_nodes_zone

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Slurm login nodes should be deployed only in approved zones to meet data residency requirements.",
        "remedies": ["Deploy login nodes in an approved zone."],
    },
    {
        "condition": "Login node zone must be in the approved zone list",
        "attribute_path": ["orchestrator", 0, "slurm", 0, "login_nodes", 0, "zone"],
        "values": ["australia-southeast1-a", "australia-southeast1-b"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details