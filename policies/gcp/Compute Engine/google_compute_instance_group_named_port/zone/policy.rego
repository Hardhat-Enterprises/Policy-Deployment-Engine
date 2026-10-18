package terraform.gcp.security.compute_engine.google_compute_instance_group_named_port.zone

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_group_named_port.vars

conditions := [
    [
        {
            "situation_description": "Instance Group Named Port is deployed outside the approved zone set",
            "remedies": [
                "Deploy the resource in an approved zone within the permitted region"
            ]
        },
        {
            "condition": "Zone must be within the approved deployment locations",
            "attribute_path": ["zone"],
            "values": [
                "us-central1-a",
                "us-central1-b",
                "us-central1-c"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details