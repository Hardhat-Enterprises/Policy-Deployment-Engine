package terraform.gcp.security.memcache.google_memcache_instance.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {
            "situation_description": "The Memcache instance does not have deletion protection enabled. Without it, the resource can be destroyed accidentally via terraform destroy or terraform apply.",
            "remedies": [
                "Set deletion_policy to PREVENT to block accidental deletion.",
                "Only relax to DELETE or ABANDON for short-lived, non-production instances."
            ]
        },
        {
            "condition": "Check if deletion_policy is set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details