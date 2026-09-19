package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.orchestrator_slurm_prolog_bash_scripts

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Slurm prolog scripts execute commands on compute nodes before jobs run and should be restricted to approved script content.",
        "remedies": ["Use only the approved Slurm prolog script."],
    },
    {
        "condition": "prolog_bash_scripts must contain approved script content",
        "attribute_path": ["orchestrator", 0, "slurm", 0, "prolog_bash_scripts"],
        "values": ["echo job-start"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details