package terraform.gcp.security.google_alloydb_instance.psc_instance_config.allowed_consumer_projects

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should only allow explicitly approved consumer projects to establish Private Service Connect connectivity.",
            "remedies": [
                "Remove unapproved consumer projects from allowed_consumer_projects.",
                "Maintain an explicit allowlist of authorised consumer project numbers.",
                "Review the list regularly to ensure only required projects retain PSC access."
            ]
        },
        {
            "condition": "The allowed_consumer_projects attribute must only contain approved consumer project numbers.",
            "attribute_path": [
                "psc_instance_config",
                0,
                "allowed_consumer_projects"
            ],
            "values": [
                "987654321098"
            ],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details