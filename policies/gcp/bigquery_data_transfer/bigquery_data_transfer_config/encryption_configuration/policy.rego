package terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.encryption_configuration
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.vars

conditions := [
  [
    {
      "situation_description": "The BigQuery Data Transfer config is missing customer-managed encryption.",
      "remedies": [
        "Add an encryption_configuration block with a valid kms_key_name.",
      ]
    },
    {
      "condition": "Check if kms_key_name is present",
      "attribute_path": ["encryption_configuration", "kms_key_name"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details