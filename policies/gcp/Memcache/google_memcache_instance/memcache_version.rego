package terraform.gcp.security.memcache.google_memcache_instance.memcache_version

import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {
            "situation_description": "The Memcache instance is running an outdated Memcached major version, increasing exposure to known vulnerabilities.",
            "remedies": [
                "Set memcache_version to MEMCACHE_1_6_15, the current supported version.",
                "Keep the instance on the latest supported major version to stay patched."
            ]
        },
        {
            "condition": "memcache_version must be the current supported version",
            "attribute_path": ["memcache_version"],
            "values": ["MEMCACHE_1_6_15"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details