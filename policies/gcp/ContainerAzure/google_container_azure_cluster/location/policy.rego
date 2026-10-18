package terraform.gcp.security.Container_Azure.google_container_azure_cluster.location

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [
    [
        {
            "situation_description": "If the location attribute is not set to an approved region, the Container Azure Cluster may be deployed in an unapproved geographic location, potentially violating data-residency requirements.",
            "remedies": ["Set the 'location' attribute to an approved region."]
        },
        {
            "condition": "check if the location attribute is set to an approved region",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details