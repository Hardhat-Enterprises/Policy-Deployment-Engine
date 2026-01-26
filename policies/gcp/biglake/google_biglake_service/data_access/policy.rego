package terraform.gcp.security.biglake.google_biglake_service.data_access

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_service.vars

conditions := [
    [
    {
        "situation_description" : "Data in BigLake is exposed without proper encryption.",
        "remedies":[
            "Ensure data at rest and in transit is encrypted."
        ]
    },
    {
        "condition": "Check that data storage is encrypted using AES-256 or a stronger algorithm.",
        "attribute_path" : ["data_storage", 0, "encryption"],
        "values" : [
            "AES-256",
            "Google-managed encryption keys"
        ],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
