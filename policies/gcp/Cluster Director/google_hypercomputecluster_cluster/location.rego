package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.location

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "Hypercompute clusters should be deployed only in approved locations.",
        "remedies": ["Deploy the cluster in an approved Australian location."],
    },
    {
        "condition": "location must be in the approved location list",
        "attribute_path": ["location"],
        "values": ["australia-southeast1", "australia-southeast2"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details