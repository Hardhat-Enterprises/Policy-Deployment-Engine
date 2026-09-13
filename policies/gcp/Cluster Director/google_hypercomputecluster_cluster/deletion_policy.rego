package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Hypercompute clusters should be protected from accidental deletion.",
        "remedies": ["Set deletion_policy to PREVENT."],
    },
    {
        "condition": "deletion_policy must prevent deletion",
        "attribute_path": ["deletion_policy"],
        "values": ["PREVENT"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details