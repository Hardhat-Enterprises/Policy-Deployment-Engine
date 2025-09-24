package terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.destination_dataset_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.vars

conditions := [
  [
    {
      "situation_description": "The destination_dataset_id uses a weak or placeholder name like 'my_', 'test', or 'default'.",
      "remedies": [
        "Use a descriptive and production-ready dataset ID such as 'bq_customerdata', 'prod_reporting'"
      ]
    },
    {
      "condition": "Check if destination_dataset_id contains banned placeholder prefixes",
      "attribute_path": ["destination_dataset_id"],
      "values": ["test", "foo", "bar", "my_", "temp", "default"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details