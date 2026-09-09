package terraform.gcp.security.bigquery.google_bigquery_connection.aws_access_role_iam_role_id

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "aws.access_role.iam_role_id references an untrusted AWS IAM role",
    "remedies":[ "Only trust approved AWS IAM roles for this connection"]},
    {
        "condition": "Test if iam_role_id references the untrusted role",
        "attribute_path" : ["aws", 0, "access_role", 0, "iam_role_id"],
        "values" : ["arn:aws:iam::999999999999:role/untrusted-omnirole"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
