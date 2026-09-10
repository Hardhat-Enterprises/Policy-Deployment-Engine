package terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.vars

conditions := [
    [
        {
            "situation_description": "Data store deletion policy allows the resource to be destroyed, risking accidental or malicious data loss",
            "remedies": [
                "Set deletion_policy to PREVENT to block Terraform from destroying the data store",
                "Set deletion_policy to ABANDON to remove from Terraform management without deleting the resource"
            ]
        },
        {
            "condition": "deletion_policy must be set to PREVENT or ABANDON",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT", "ABANDON"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
