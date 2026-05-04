package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.location

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "location is outside the approved deployment region for this data policy.",
            "remedies": ["Set location to australia-southeast1."]
        },
        {
            "condition": "location is set to an approved region",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
