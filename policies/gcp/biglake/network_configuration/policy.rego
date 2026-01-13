package terraform.gcp.security.biglake.google_biglake_service.network_configuration

import data.terraform.gcp.helpers
import data.terraform.gcp.security.biglake.google_biglake_service.vars

conditions := [
    [
    {
        "situation_description" : "BigLake network is exposed to unapproved IP ranges.",
        "remedies":[
            "Limit network access to approved IP ranges."
        ]
    },
    {
        "condition": "Check that the network is restricted to approved IP ranges only.",
        "attribute_path" : ["network_config", 0, "allowed_ip_ranges"],
        "values" : [
            "10.0.0.0/24",
            "192.168.0.0/16"
        ],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
