package terraform.gcp.security.Container_Azure.google_container_azure_cluster.azure_region

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [[
    {
        "situation_description": "If the azure_region attribute is not set to an approved Azure region, the Container Azure Cluster may be deployed in an unapproved geographic location, potentially violating data-residency requirements.",
        "remedies": ["Set the 'azure_region' attribute to an approved Azure region."],
    },
    {
        "condition": "check if the azure_region attribute is set to an approved Azure region",
        "attribute_path": ["azure_region"],
        "values": ["australia-southeast1"],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details