package terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.sensitive_params
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.vars

conditions := [
  [
    {
      "situation_description": "Sensitive credentials such as AWS Access Key or Secret are hardcoded in the params block.",
      "remedies": [
        "Use Terraform variables marked as sensitive and avoid hardcoding credentials.",
        "Store secrets in a secret manager and inject securely."
      ]
    },
    {
      "condition": "Detect hardcoded sensitive values like aws_access_key_id or aws_secret_access_key",
      "attribute_path": ["change", "after", "params"],
      "values": ["aws_access_key_id", "aws_secret_access_key"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details