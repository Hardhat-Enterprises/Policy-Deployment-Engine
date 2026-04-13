package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.allowed_location

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "location is outside the approved deployment region for this data policy.",
            "remedies": ["Set location to us-central1."]
        },
        {
            "condition": "location is set to an approved region",
            "attribute_path": ["location"],
            "values": ["us-central1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
