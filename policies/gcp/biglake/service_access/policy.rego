package terraform.gcp.security.biglake.google_biglake_service.service_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.biglake.google_biglake_service.vars

conditions := [
    [
    {
        "situation_description" : "Service account has broader access than allowed for BigLake service.",
        "remedies":[
            "Restrict service account access to BigLake only."
        ]
    },
    {
        "condition": "Check that the service account has permissions limited to BigLake service only.",
        "attribute_path" : ["service_accounts", 0, "permissions"],
        "values" : [
            "biglake.data.read",
            "biglake.data.write"
        ],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
