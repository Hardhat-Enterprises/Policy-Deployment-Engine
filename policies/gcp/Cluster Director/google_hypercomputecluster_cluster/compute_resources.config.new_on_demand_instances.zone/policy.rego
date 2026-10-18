package terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.compute_resources_config_new_on_demand_instances_zone

import data.terraform.helpers
import data.terraform.gcp.security.cluster_director.google_hypercomputecluster_cluster.vars

conditions := [[
    {
        "situation_description": "On-demand compute instances should be deployed only in approved zones to meet data residency requirements.",
        "remedies": ["Deploy on-demand instances in an approved zone."],
    },
    {
        "condition": "On-demand instance zone must be in the approved zone list",
        "attribute_path": ["compute_resources", 0, "config", 0, "new_on_demand_instances", 0, "zone"],
        "values": ["australia-southeast1-a", "australia-southeast1-b"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details