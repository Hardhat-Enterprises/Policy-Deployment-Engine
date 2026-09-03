package terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.location

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.vars

conditions := [
    [
        {
            "situation_description": "Data from a sitemap should reside in an approved region",
            "remedies": [
                "Set location to eu"
            ]
        },
        {
            "condition": "location must be an approved value",
            "attribute_path": ["location"],
            "values": ["eu"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details