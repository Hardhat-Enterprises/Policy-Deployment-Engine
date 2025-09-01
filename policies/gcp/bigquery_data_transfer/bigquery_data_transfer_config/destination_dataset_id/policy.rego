package terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.destination_dataset_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.vars

conditions := [
  [
    {
      "situation_description": "The destination_dataset_id uses a weak, generic, or non-sense name such as 'my_', 'test', or 'foo'.",
      "remedies": [
        "Use a descriptive and production-ready dataset ID such as 'bq_customerdata' or 'prod_analytics'.",
        "Avoid test names or placeholders in configurations."
      ]
    },
    {
      "condition": "Check if destination_dataset_id contains banned prefixes name",
      "attribute_path": ["destination_dataset_id"],
      "values": ["test", "foo", "bar", "my_", "temp", "default"],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details