package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.orchestrator_slurm_node_sets_compute_instance_startup_script

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Compute-node startup scripts execute commands automatically when instances start and should be restricted to approved content.",
        "remedies": ["Use only the approved compute-node startup script."],
    },
    {
        "condition": "compute instance startup_script must contain approved content",
        "attribute_path": ["orchestrator", 0, "slurm", 0, "node_sets", 0, "compute_instance", 0, "startup_script"],
        "values": ["#!/bin/bash\necho compute-node-ready"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details