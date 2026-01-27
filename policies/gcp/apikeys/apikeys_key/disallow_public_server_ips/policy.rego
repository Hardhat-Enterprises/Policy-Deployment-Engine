package terraform.gcp.security.apikeys.apikeys_key.disallow_public_server_ips

import data.terraform.helpers
import data.terraform.gcp.security.apikeys.apikeys_key.vars

conditions := [
    [
    {
        "situation_description" : "Server key restrictions allow calls from 0.0.0.0/0 (any IP).",
        "remedies":[
            "Restrict server_key_restrictions.allowed_ips to specific trusted IP ranges."
        ]
    },
    {
        "condition": "Check that allowed_ips does not contain public 0.0.0.0/0.",
        # restrictions[0].server_key_restrictions[0].allowed_ips[0]
        "attribute_path" : ["restrictions", 0, "server_key_restrictions", 0, "allowed_ips", 0],
        "values" : ["0.0.0.0/0"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
