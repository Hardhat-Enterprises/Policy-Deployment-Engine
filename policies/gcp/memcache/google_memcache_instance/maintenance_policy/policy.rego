package terraform.gcp.security.memcache.google_memcache_instance.maintenance_policy 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars


conditions := [
    [
        {
            "situation_description": "Checks if maintenance_policy is setted explicitly",
            "remedies": ["Add `maintenance_policy` block to redis_instance resource"]
        },
        {
            "condition": "Maintenance policy must be present",
            "attribute_path": ["maintenance_policy"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Checks if maintenance_policy.weekly_maintenance_window is setted explicitly",
            "remedies": ["Add `maintenance_policy.weekly_maintenance_window` block."]
        },
        {
            "condition": "weekly_maintenance_window must be present",
            "attribute_path": ["maintenance_policy", 0, "weekly_maintenance_window"],
            "values": [[], null, ""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details