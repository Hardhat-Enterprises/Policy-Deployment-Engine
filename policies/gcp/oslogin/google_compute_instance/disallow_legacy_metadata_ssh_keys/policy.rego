package terraform.gcp.security.oslogin.google_compute_instance.disallow_legacy_metadata_ssh_keys

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

conditions := [
    [
        {
            "situation_description": "Instances with OS Login must not use legacy ssh-keys metadata",
            "remedies": [
                "Remove ssh-keys entry from metadata when OS Login is enabled"
            ]
        },
        {
            "condition": "Legacy ssh-keys metadata must not be present",
            "attribute_path": ["metadata", "ssh-keys"],
            "values": [null],    # Must be null/absent
            "policy_type": "whitelist"
        }
    ]
]

# Outputs
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
