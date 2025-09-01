package terraform.gcp.security.bigquery_connection.google_bigquery_connection.aws.access_role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "AWS access role for the BigQuery connection must be an approved IAM role",
    "remedies": [
      "Set aws.access_role.iam_role_id to one of the approved IAM role ARNs"
    ]
  },
  {
    "condition": "aws.access_role.iam_role_id must be in the approved whitelist",
    "attribute_path": ["aws", 0, "access_role", 0, "iam_role_id"],
    "values": [
      "arn:aws:iam::123456789012:role/approved-role-1",
      "arn:aws:iam::123456789012:role/approved-role-2"
    ],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

