package terraform.gcp.security.compute_engine.google_compute_instance_template.metadata

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's metadata does not set enable-oslogin to TRUE, missing a key security-sensitive toggle that centralizes SSH access management via IAM",
            "remedies": ["Set metadata = { \"enable-oslogin\" = \"TRUE\" } to enforce OS Login for centralized, auditable SSH access control"]
        },
        {
            "condition": "metadata['enable-oslogin'] must be exactly 'TRUE'",
            "attribute_path": ["metadata", "enable-oslogin"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details