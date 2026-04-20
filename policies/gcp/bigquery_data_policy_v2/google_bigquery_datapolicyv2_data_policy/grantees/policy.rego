package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.grantees

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "grantees includes the public principal, which exposes governed data too broadly.",
            "remedies": ["Remove principalSet://goog/public:all from grantees."]
        },
        {
            "condition": "grantees does not include the public principal",
            "attribute_path": ["grantees"],
            "values": ["principalSet://goog/public:all"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
