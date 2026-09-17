package terraform.gcp.security.google_alloydb_instance.gce_zone

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should be deployed in an approved geographic zone to support data residency and organisational compliance requirements.",
            "remedies": [
                "Deploy the AlloyDB instance in an approved geographic zone.",
                "Set gce_zone to an organisation-approved zone."
            ]
        },
        {
            "condition": "The gce_zone attribute must be set to an approved geographic zone.",
            "attribute_path": ["gce_zone"],
            "values": [
                "australia-southeast1-b"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details