package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.data_policy_type

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "data_policy_type is set to RAW_DATA_ACCESS_POLICY, which allows direct access to the underlying data.",
            "remedies": ["Set data_policy_type to DATA_MASKING_POLICY or COLUMN_LEVEL_SECURITY_POLICY."]
        },
        {
            "condition": "data_policy_type is not set to RAW_DATA_ACCESS_POLICY",
            "attribute_path": ["data_policy_type"],
            "values": ["RAW_DATA_ACCESS_POLICY"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
