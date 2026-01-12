package terraform.gcp.security.oslogin.google_compute_instance.block_project_ssh_keys

import data.terraform.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

conditions := [
    [
        {
            "situation_description": "Instances must block project-wide SSH keys when OS Login is enabled",
            "remedies": [
                "Set metadata.block-project-ssh-keys = TRUE",
                "Remove metadata.block-project-ssh-keys = FALSE"
            ]
        },
        {
            "condition": "block-project-ssh-keys metadata key must equal TRUE",
            "attribute_path": ["metadata", "block-project-ssh-keys"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
