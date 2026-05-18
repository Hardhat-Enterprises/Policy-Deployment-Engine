package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.data_masking_policy

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "predefined_expression uses a weak masking style that may still expose useful parts of the original value.",
            "remedies": ["Set data_masking_policy.predefined_expression to a stronger masking expression such as SHA256, RANDOM_HASH, ALWAYS_NULL, DEFAULT_MASKING_VALUE, EMAIL_MASK, or DATE_YEAR_MASK."]
        },
        {
            "condition": "predefined_expression is set to an approved masking expression",
            "attribute_path": ["data_masking_policy", 0, "predefined_expression"],
            "values": ["SHA256", "RANDOM_HASH", "ALWAYS_NULL", "DEFAULT_MASKING_VALUE", "EMAIL_MASK", "DATE_YEAR_MASK"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
