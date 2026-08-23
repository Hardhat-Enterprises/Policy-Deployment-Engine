package terraform.gcp.security.compute_engine.google_compute_node_group.zone

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_node_group.vars

conditions := [
    [
        {
            "situation_description": "The compute node group is deployed outside the organisation's approved geographic deployment boundary.",
            "remedies": [
                "Deploy the node group in an approved zone.",
                "Select a zone that satisfies organisational data residency, security, and infrastructure requirements.",
                "Review and maintain the approved zone baseline as deployment requirements change."
            ]
        },
        {
            "condition": "Require the compute node group to be deployed within an approved zone.",
            "attribute_path": ["zone"],
            "values": [
                "australia-southeast1-a",
                "australia-southeast1-b",
                "australia-southeast1-c"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details