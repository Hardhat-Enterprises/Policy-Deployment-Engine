package terraform.gcp.security.memcache.google_memcache_instance.reserved_ip_range_id
import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {"situation_description" : "Checks if reserved ip range id is provided",
        "remedies":[
            "reserved_ip_range_id must be setted explicitly","reserved_ip_range_id must refer to a reserved range name created by the user."
            ]
        },
        {
            "condition": "Set reserved_ip_range_id",
            "attribute_path" : ["reserved_ip_range_id"], 
            "values" : [null, "", []],
            "policy_type" : "blacklist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details