package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.grantees_not_empty

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "grantees is empty, so governed data access is not explicitly scoped to approved principals.",
            "remedies": ["Set grantees to the specific principals that should have governed data access."]
        },
        {
            "condition": "grantees is not empty",
            "attribute_path": ["grantees"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
