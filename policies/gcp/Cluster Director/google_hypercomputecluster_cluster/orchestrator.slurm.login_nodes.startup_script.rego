package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.orchestrator_slurm_login_nodes_startup_script

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Login node startup scripts execute commands automatically when instances start and should be restricted to approved content.",
        "remedies": ["Use only the approved login node startup script."],
    },
    {
        "condition": "login node startup_script must contain approved content",
        "attribute_path": ["orchestrator", 0, "slurm", 0, "login_nodes", 0, "startup_script"],
        "values": ["#!/bin/bash\necho login-node-ready"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details