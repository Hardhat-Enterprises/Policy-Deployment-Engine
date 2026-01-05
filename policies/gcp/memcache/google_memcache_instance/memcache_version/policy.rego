package terraform.gcp.security.memcache.google_memcache_instance.memcache_version
import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {"situation_description" : "Checks if memcache_version is setted explicitly",
        "remedies":[
            "memcache_version must be setted explicitly","Possible values are: [MEMCACHE_1_5] or [MEMCACHE_1_6_15]"
            ]
        },
        {
            "condition": "Set memcache_version",
            "attribute_path" : ["memcache_version"], 
            "values" : ["MEMCACHE_1_5", "MEMCACHE_1_6_15"],
            "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details