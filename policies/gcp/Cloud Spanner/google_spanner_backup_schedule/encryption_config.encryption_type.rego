package terraform.gcp.security.cloud_spanner.google_spanner_backup_schedule.encryption_config_encryption_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_backup_schedule.vars

conditions := [
  [
    {
      "situation_description": "Cloud Spanner backup schedule does not use customer-managed encryption.",
      "remedies": [
        "Set encryption_config.encryption_type = CUSTOMER_MANAGED_ENCRYPTION and specify a kms_key_name."
      ]
    },
    {
      "condition": "encryption_type must be CUSTOMER_MANAGED_ENCRYPTION",
      "attribute_path": ["encryption_config", "encryption_type"],
      "values": ["CUSTOMER_MANAGED_ENCRYPTION"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
