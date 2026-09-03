package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

# Require a customer-managed encryption key to be configured.
conditions := [
    [
        {
            "situation_description": "Does the connector configure a KMS key for CMEK encryption?",
            "remedies": ["Set kms_key_name to a non-empty Cloud KMS key resource name."],
        },
        {
            "condition": "KMS key name is not configured",
            "attribute_path": ["kms_key_name"],
            "values": [null, ""],
            "policy_type": "blacklist",
        },
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
