package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy_iam_binding.no_raw_data_reader_role

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "IAM binding grants the raw data reader role on the data policy.",
            "remedies": ["Use a masked-reader or viewer role instead of roles/bigquerydatapolicy.rawDataReader."]
        },
        {
            "condition": "role is not set to roles/bigquerydatapolicy.rawDataReader",
            "attribute_path": ["role"],
            "values": ["roles/bigquerydatapolicy.rawDataReader"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
