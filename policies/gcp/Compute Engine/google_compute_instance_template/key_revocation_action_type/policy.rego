package terraform.gcp.security.compute_engine.google_compute_instance_template.key_revocation_action_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's key_revocation_action_type is not set to STOP, so the instance will keep running even if its customer-managed encryption key (CMEK) is revoked",
            "remedies": ["Set key_revocation_action_type to 'STOP' so the instance is halted when its encryption key is revoked"]
        },
        {
            "condition": "key_revocation_action_type must be STOP",
            "attribute_path": ["key_revocation_action_type"],
            "values": ["STOP"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details