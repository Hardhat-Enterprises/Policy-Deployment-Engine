package terraform.gcp.security.dataflow.google_dataflow_job.network

import data.terraform.helpers
import data.terraform.gcp.security.dataflow.google_dataflow_job.vars

conditions := [
    [
        {
            "situation_description": "Dataflow job uses the default VPC network which lacks proper firewall rules and network segmentation.",
            "remedies": ["Set 'network' to a dedicated VPC network with appropriate security controls."]
        },
        {
            "condition": "Check if the default network is not used",
            "attribute_path": ["network"],
            "values": ["default"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details