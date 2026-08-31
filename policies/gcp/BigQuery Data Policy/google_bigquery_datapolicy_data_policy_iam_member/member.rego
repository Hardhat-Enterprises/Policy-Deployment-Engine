package terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy_iam_member.vars

conditions := [
    [
    {"situation_description" : "Ensure member is provided",
    "remedies":["Set member to allAuthenticatedUsers"]},
    {
        "condition": "Validating member",
        "attribute_path" : ["member"],
        "values" : ["allAuthenticatedUsers, allUsers"], 
        "policy_type" : "blacklist"
    }
    ],
    [
    {"situation_description" : "Ensure member is provided",
    "remedies":["Only allowed emails can be accessible"]},
    {
        "condition": "Validating email",
        "attribute_path" : ["member"],
        "values" : ["user:user@external.com"], 
        "policy_type" : "blacklist"
    }
    ],
    [
    {"situation_description" : "Ensure member is provided",
    "remedies":["Only allowed domains can be accessible"]},
    {
        "condition": "Validating email",
        "attribute_path" : ["member"],
        "values" : ["domain:external.com"], 
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details