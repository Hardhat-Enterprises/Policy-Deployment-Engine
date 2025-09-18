package terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.vars

conditions := [[
  {
    "situation_description": "Location must be australia-southeast1 (Melbourne) and australia-southeast2 (Sydney).",
    "remedies": ["Set google_bigquery_data_transfer_config.location to \"australia-southeast1\"."]
  },
  {
    "condition": "Location is not australia-southeast1",
    "attribute_path": ["location"],
    "values": ["australia-southeast1"],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details