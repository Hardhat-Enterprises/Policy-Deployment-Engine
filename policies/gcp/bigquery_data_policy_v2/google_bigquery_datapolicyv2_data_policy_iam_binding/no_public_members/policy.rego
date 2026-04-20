package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy_iam_binding.no_public_members

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "IAM binding exposes the data policy to public principals.",
            "remedies": ["Remove public principals such as allUsers and allAuthenticatedUsers."]
        },
        {
            "condition": "members does not include public principals",
            "attribute_path": ["members"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
