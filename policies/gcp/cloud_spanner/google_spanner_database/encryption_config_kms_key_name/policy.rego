package terraform.gcp.security.cloud_spanner.google_spanner_database.encryption_config_kms_key_name
import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_database.vars

conditions := [
    [
        {"situation_description" : "Check for valid encryption_config.kms_key_name",
         "remedies": ["Set encryption_config.kms_key_name to a valid KMS key"]},
        {
            "condition": "Check for valid encryption_config.kms_key_name",
            "attribute_path": ["encryption_config", "kms_key_name"],
            "values" : [""],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details