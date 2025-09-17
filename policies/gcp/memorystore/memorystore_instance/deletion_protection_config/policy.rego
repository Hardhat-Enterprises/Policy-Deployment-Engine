```rego
package terraform.gcp.security.memorystore_redis.instance.deletion_protection_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystore.redis.vars

conditions := [
    [
        {
            "situation_description": "Redis instances must have deletion protection enabled to prevent accidental data loss.",
            "remedies": [
                "Set `deletion_protection_config.enable_deletion_protection = true` in the google_redis_instance resource block."
            ]
        },
        {
            "condition": "Checks if deletion_protection_config.enable_deletion_protection is true",
            "attribute_path": ["deletion_protection_config", "enable_deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
```