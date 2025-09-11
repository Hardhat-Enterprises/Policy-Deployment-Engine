package terraform.gcp.security.bigquery_connection.google_bigquery_connection.aws1
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require AWS IAM Role ID to be from the approved list",
    "remedies": [
      "Set aws.access_role.iam_role_id to the approved ARN"
    ]
  },
  {
    "condition": "iam_role_id must be approved",
    "attribute_path": ["aws",0,"access_role",0,"iam_role_id"],
    "policy_type": "whitelist",
    "values": [
      "arn:aws:iam::123456789012:role/bq-connection-prod"
    ]
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
