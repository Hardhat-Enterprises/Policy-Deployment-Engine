package terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.project
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_transfer.bigquery_data_transfer_config.vars

conditions := [
  [
    {"situation_description": "IAM role assignment is hardcoded to a specific project",
     "remedies": [ "Use a variable for project_id instead of a hardcoded string" ]},
    {
      "condition": "Project attribute must reference a variable, not a hardcoded string",
      "attribute_path": ["project"],
      "values": ["civil-lightning-468910-m1"],
      "policy_type": "blacklist"
    }
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details