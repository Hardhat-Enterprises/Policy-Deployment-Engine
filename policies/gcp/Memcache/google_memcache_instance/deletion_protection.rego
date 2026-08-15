package terraform.gcp.security.memcache.google_memcache_instance.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {
            "situation_description": "The Memcache instance has deletion_protection set to false, allowing the instance to be destroyed via terraform destroy or terraform apply.",
            "remedies": [
                "Set deletion_protection to true to block accidental deletion.",
                "Only set to false for short-lived, non-production instances."
            ]
        },
        {
            "condition": "Check if deletion_protection is set to true",
            "attribute_path": ["deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details