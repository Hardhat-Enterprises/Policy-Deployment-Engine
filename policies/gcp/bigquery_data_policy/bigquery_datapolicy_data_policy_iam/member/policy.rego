package terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.member
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details