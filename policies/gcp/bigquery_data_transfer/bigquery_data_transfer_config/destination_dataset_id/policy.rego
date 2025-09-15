package terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.destination_dataset_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.vars

conditions := [
  [
    {
      "situation_description": "The destination_dataset_id uses a weak, generic, or placeholder name such as 'my_', 'test', 'default', or 'temp'. This increases the risk of misrouting sensitive data or accidentally writing to non-production datasets.",
      "remedies": [
        "Use a descriptive and production-ready dataset ID such as 'bq_customerdata', 'prod_reporting', or 'secure_finance_q1'.",
        "Avoid test names or placeholder names like 'my_dataset', 'default', or 'foo'."
      ]
    },
    {
      "condition": "Check if destination_dataset_id contains banned placeholder prefixes",
      "attribute_path": ["destination_dataset_id"],
      "values": ["test", "foo", "bar", "my_", "temp", "default"],
      "policy_type": "pattern blacklist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details