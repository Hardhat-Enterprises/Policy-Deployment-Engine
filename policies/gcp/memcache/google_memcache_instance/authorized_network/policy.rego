package terraform.gcp.security.memcache.google_memcache_instance.authorized_network 
import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {"situation_description" : "Check if authorized network is non-defaulted",
        "remedies":[ "Set the authorized network to a non-default value"]},
        {
            "condition": "Authorized network must be explicitly declared and cannot be defaulted.",
            "attribute_path" : ["authorized_network"],
            "values" : [null, "default"], 
            "policy_type" : "blacklist" 
        }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details