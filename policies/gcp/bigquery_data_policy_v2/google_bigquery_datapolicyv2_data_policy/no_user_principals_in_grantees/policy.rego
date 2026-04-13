package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.no_user_principals_in_grantees

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "grantees includes user principals, which weakens least-privilege control for governed data access.",
            "remedies": ["Replace direct user principals in grantees with service accounts, groups, or other approved managed identities."]
        },
        {
            "condition": "grantees must not contain direct user principals",
            "attribute_path": ["grantees"],
            "values": ["principal://iam.googleapis.com/users/"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
